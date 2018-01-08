# Copyright (c) Microsoft Corporation. All rights reserved.
# See LICENSE.txt in the project root for license information.

#requires -Modules AzureStack.Common

<#
    .SYNOPSIS
    Contains a function for side-syndication of a gallery item and an image from blob uri's
#>

Function Add-SyndicatedProduct{

    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullorEmpty()]
        [ValidateScript({Test-Path $_})]
        [String] $galleryItemBlobURI,
 
        [Parameter(Mandatory=$true)]
        [ValidatePattern("[a-zA-Z0-9-]{3,}")]
        [String] $publisher,
       
        [Parameter(Mandatory=$true)]
        [ValidatePattern("[a-zA-Z0-9-]{3,}")]
        [String] $offer,
    
        [Parameter(Mandatory=$true)]
        [ValidatePattern("[a-zA-Z0-9-]{3,}")]
        [String] $sku,
    
        [Parameter(Mandatory=$true)]
        [ValidatePattern("\d+\.\d+\.\d+")]
        [String] $version,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullorEmpty()]
        [String] $osDiskBlobURI,

        [Parameter(Mandatory=$true)]
        [ValidateSet('Windows' ,'Linux')]
        [String] $osType,

        [string[]] $dataDiskBlobURIs,

        [string] $billingPartNumber,

        [string] $title,

        [string] $description,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullorEmpty()]
        [String] $tenantID,

        [String] $location = 'local',

        [Parameter(Mandatory=$true)]
        [System.Management.Automation.PSCredential] $azureStackCredentials,

        [string] $armEndpoint = 'https://api.local.azurestack.external'
    )

    Import-Module .\AzureStack.Marketplace
    Add-GalleryItem -galleryItemBlobURI $galleryItemBlobURI -tenantID $tenantId -location $location -azureStackCredentials $azureStackCredentials -armEndpoint $armEndpoint

    $PublishArguments = @{
            publisher = $publisher
            offer = $offer
            sku = $sku
            version = $version
            osType = $osType
            title = $title
            description = $description
            tenantID = $tenantID
            azureStackCredentials = $AzureStackCredentials
            ArmEndpoint = $ArmEndpoint
            location = $location
        }

        Add-VMImage -osDiskBlobURI $osDiskBlobURI -dataDiskBlobURIs $dataDiskBlobURIs @PublishArguments -CreateGalleryItem false
    }

Function Test-AzureStackActivation {

    Param(

        [Parameter(Mandatory=$true)]
        [String] $ArmEndpoint,

        [String] $resourceGroupName

    )
    
    $location = $Global:AzureStackConfig.ArmLocation

    if([string]::IsNullOrEmpty($resourceGroupName))
    {
        $deploymentId = Get-AzureStackDeploymentId -TenantArmEndpoint $ArmEndpoint 
        $resourceGroupName = "acrp-" + $deploymentId
    }

    if (-not (Get-AzureRmResourceGroup -Name $resourceGroupName -Location $location -ErrorAction SilentlyContinue)) {
        Log-Error "Azure stack activation resource group is not found";
    }

    $subscription = Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription"
    $token = $Global:AzureStackConfig.Token
    $headers =  @{ Authorization = ("Bearer $token") }

    $baseURI = $ArmEndpoint
    $uri = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/resourceGroups/' + $resourceGroupName + '/providers/Microsoft.AzureBridge.Admin/activations?api-version=2016-01-01'

    Log-Info "$uri"

    $activation = Invoke-RestMethod -Method GET -Uri $uri -ContentType 'application/json' -Headers $Headers

    if($activation -eq $null)
    {
        Log-Error "Azure stack activation is not found";
    }

    $activation
}

<#
.Synopsis
   Retrieve the list of the products which already available on Azure Stack syndication service.
.NOTES
   The function is called only after Set-AzureStackEnvironment with the correct parameters
#>

Function List-AzureDiscoveredProducts {
    Param(
        [Parameter(Mandatory=$true)]
        [String] $ArmEndpoint,

        [String] $resourceGroupName

    )

    if([string]::IsNullOrEmpty($resourceGroupName))
    {
        $deploymentId = Get-AzureStackDeploymentId -TenantArmEndpoint $ArmEndpoint 
        $resourceGroupName = "acrp-" + $deploymentId
    }

    $location = $Global:AzureStackConfig.ArmLocation

    if (-not (Get-AzureRmResourceGroup -Name $resourceGroupName -Location $location -ErrorAction SilentlyContinue)) {
        $curTimer = Start-WkTimer -TimerName "Resource group creation $resourceGroupName"  
        New-AzureRmResourceGroup -Name $resourceGroupName -Location $location 
        $allTimers += End-WkTimer -TimerName "Resource group creation $resourceGroupName" -Timer $curTimer
    }
    
    $subscription = Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription"
    $token = $Global:AzureStackConfig.Token
    $headers =  @{ Authorization = ("Bearer $token") }

    $baseURI = $ArmEndpoint
    $uri = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/resourceGroups/' + $resourceGroupName + '/providers/Microsoft.AzureBridge.Admin/activations/default/products?api-version=2016-01-01'
    
    Log-Info "$uri"

    $products = Invoke-RestMethod -Method GET -Uri $uri -Headers $Headers
    
    if($products -eq $null)
    {
        Log-Error "Azure stack discovered products are not found";
    }

    $products | ConvertTo-Json
}

<#
.Synopsis
   Downloads the product which already exists in Azure Stack syndication service.
.NOTES
   The function is called only after Set-AzureStackEnvironment with the correct parameters
#>

Function Download-AzureDiscoveredProduct {
    Param(
        [Parameter(Mandatory=$true)]
        [String] $productName,
        
        [Parameter(Mandatory=$true)]
        [String] $ArmEndpoint,

        [String] $resourceGroupName

    )

    $allTimers = @()

    if([string]::IsNullOrEmpty($resourceGroupName))
    {
        $deploymentId = Get-AzureStackDeploymentId -TenantArmEndpoint $ArmEndpoint 
        $resourceGroupName = "acrp-" + $deploymentId
    }

    $location = $Global:AzureStackConfig.ArmLocation

    if (-not (Get-AzureRmResourceGroup -Name $resourceGroupName -Location $location -ErrorAction SilentlyContinue)) {
        $curTimer = Start-WkTimer -TimerName "Resource group creation $resourceGroupName"  
        New-AzureRmResourceGroup -Name $resourceGroupName -Location $location 
        $allTimers += End-WkTimer -TimerName "Resource group creation $resourceGroupName" -Timer $curTimer
    }
    
    $subscription = Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription"
    $token = $Global:AzureStackConfig.Token
    $headers =  @{ Authorization = ("Bearer $token") }

    $baseURI = $ArmEndpoint
    $uri = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/resourceGroups/' + $resourceGroupName + '/providers/Microsoft.AzureBridge.Admin/activations/default/products/' + $productName + '/download?api-version=2016-01-01'
    $uriGet = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/resourceGroups/' + $resourceGroupName + '/providers/Microsoft.AzureBridge.Admin/activations/default/downloadedProducts/' + $productName + '?api-version=2016-01-01'
    
    Log-Info "$uri"

    $curTimer = Start-WkTimer -TimerName "Downloading $productName"            
    
    try {
        $response = Invoke-RestMethod -Method POST -Uri $uri -ContentType 'application/json' -Headers $Headers
    }
    catch
    {
        Write-Verbose "Download product failed. $_"
        throw $_
    }

    $product = Invoke-RestMethod -Method GET -Uri $uriGet -ContentType 'application/json' -Headers $Headers

    while($product.Properties.ProvisioningState -ne 'Succeeded')
    {
        if($product.Properties.ProvisioningState -eq 'Failed')
        {
            Write-Host "Product download failed. :(";
            break;
        }

        if($product.Properties.ProvisioningState -eq 'Canceled')
        {
            Write-Host "Product download was canceled.";
            break;
        }

        Write-Host "Downloading";
        Start-Sleep -s 10
        $product = Invoke-RestMethod -Method GET -Uri $uriGet -ContentType 'application/json' -Headers $Headers
    }
    
    $allTimers += End-WkTimer -TimerName "Downloading $productName" -Timer $curTimer

    Log-Timer -Timers $allTimers -TableName "Product downloading"
}

<#
.Synopsis
   Deletes the product which was already syndicated to Azure Stack.
.NOTES
   The function is called only after Set-AzureStackEnvironment with the correct parameters
#>

Function Delete-AzureDiscoveredProduct {
    Param(
        [Parameter(Mandatory=$true)]
        [String] $productName,
        
        [Parameter(Mandatory=$true)]
        [String] $ArmEndpoint,

        [String] $resourceGroupName,
 
        [bool] $DoNotDeleteRg = $true

    )

    $allTimers = @()

    if([string]::IsNullOrEmpty($resourceGroupName))
    {
        $deploymentId = Get-AzureStackDeploymentId -TenantArmEndpoint $ArmEndpoint 
        $resourceGroupName = "acrp-" + $deploymentId
    }

    $location = $Global:AzureStackConfig.ArmLocation

    if (-not (Get-AzureRmResourceGroup -Name $resourceGroupName -Location $location -ErrorAction SilentlyContinue)) {
        Log-Error "Resource group is not found";
    }

    $subscription = Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription"
    $token = $Global:AzureStackConfig.Token
    $headers =  @{ Authorization = ("Bearer $token") }

    $baseURI = $ArmEndpoint
    $uri = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/resourceGroups/' + $resourceGroupName + '/providers/Microsoft.AzureBridge.Admin/activations/default/downloadedProducts/' + $productName + '?api-version=2016-01-01'

    Log-Info "$uri"

    $curTimer = Start-WkTimer -TimerName "Deleting $productName"            
    $response = Invoke-RestMethod -Method DELETE -Uri $uri -ContentType 'application/json' -Headers $Headers

    $product = Invoke-RestMethod -Method GET -Uri $uri -ContentType 'application/json' -Headers $Headers

    Assert-ProductDeletion {Invoke-RestMethod -Method GET -Uri $uri -ContentType 'application/json' -Headers $Headers}

    $allTimers += End-WkTimer -TimerName "Deleting $productName" -Timer $curTimer
    
    #cleanup
    if (!$DoNotDeleteRg) {            
        $curTimer = Start-WkTimer -TimerName "Resource group removing $resourceGroupName"
        Remove-AzureRmResourceGroup -Name $resourceGroupName -Force
        $allTimers += End-WkTimer -TimerName "Resource group removing $resourceGroupName" -Timer $curTimer
    }

    Log-Timer -Timers $allTimers -TableName "Product deleting"
}