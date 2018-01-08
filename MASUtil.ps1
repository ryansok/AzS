Add-Type -TypeDefinition @"
       public enum ImageType
       {
          WS2016DTC,
          WS2012R2DTC,
          WS2016DTCCore,
          CustomScriptExtension,
          DscExtension,
          Ubuntu1604,
          Ubuntu1404,
          Ubuntu1404_1_0_20161208,
          CentOS69,
          CentOS73,
          Debian8,
          Suse11,
          Suse12
       }
"@ 

function Get-ImageMatadata
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ImageType] $ImageType
    )

    $Products = @{}

    $WS2016DTC = @{}
    $WS2016DTC.MarketplaceProductName = "Windows Server 2016 Datacenter"
    $WS2016DTC.Publisher = "MicrosoftWindowsServer"
    $WS2016DTC.Offer = "WindowsServer"
    $WS2016DTC.SKU = "2016-Datacenter"
    $WS2016DTC.Version = "2016.127.20171017"
    $WS2016DTC.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/Server2016DatacenterFullBYOL1017.vhd"
    $WS2016DTC.OSType = "Windows"

    $WS2016DTCCore = @{}
    $WS2016DTCCore.MarketplaceProductName = "Windows Server 2016 Datacenter - Server Core"    
    $WS2016DTCCore.Publisher = "MicrosoftWindowsServer"
    $WS2016DTCCore.Offer = "WindowsServer"
    $WS2016DTCCore.SKU = "2016-Datacenter-Server-Core"
    $WS2016DTCCore.Version = "2016.127.20171017"
    $WS2016DTCCore.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/Server2016DatacenterCoreBYOL1017.vhd"
    $WS2016DTCCore.OSType = "Windows"

    $WS2012R2DTC = @{}
    $WS2012R2DTC.MarketplaceProductName = "Windows Server 2012 R2 Datacenter"
    $WS2012R2DTC.Publisher = "MicrosoftWindowsServer"
    $WS2012R2DTC.Offer = "WindowsServer"
    $WS2012R2DTC.SKU = "2012-R2-Datacenter"
    $WS2012R2DTC.Version = "4.127.20171017"
    $WS2012R2DTC.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/Server2012R2DatacenterBYOL1017.vhd"
    $WS2012R2DTC.OSType = "Windows"

    $CustomScriptExtension = @{}
    $CustomScriptExtension.MarketplaceProductName = "Custom Script Extension"
    $CustomScriptExtension.Publisher = "Microsoft.Compute"
    $CustomScriptExtension.Offer = "WindowsServer"
    $CustomScriptExtension.Version = "1.9"

    $DscExtension = @{}
    $DscExtension.MarketplaceProductName = "PowerShell Desired State Configuration"
    $DscExtension.Publisher = "Microsoft.Powershell"
    $DscExtension.Offer = "WindowsServer"
    $DscExtension.Version = "2.26.0.0"

    $Ubuntu1604 = @{}
    $Ubuntu1604.MarketplaceProductName = "Ubuntu Server 16.04 LTS"
    $Ubuntu1604.Publisher = "Canonical"
    $Ubuntu1604.Offer = "UbuntuServer"
    $Ubuntu1604.SKU = "16.04-LTS"
    $Ubuntu1604.Version = "16.04.201711072"
    $Ubuntu1604.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/Ubuntu1604-20171107.2.vhd"
    $Ubuntu1604.OSType = "Linux"

    $Ubuntu1404 = @{}
    $Ubuntu1404.MarketplaceProductName = "Ubuntu Server 14.04 LTS"
    $Ubuntu1404.Publisher = "Canonical"
    $Ubuntu1404.Offer = "UbuntuServer"
    $Ubuntu1404.SKU = "14.04.5-LTS"
    $Ubuntu1404.Version = "14.04.20171010"
    $Ubuntu1404.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/Ubuntu1404-20171010.vhd"
    $Ubuntu1404.OSType = "Linux"

    $Ubuntu1404_1_0_20161208 = @{}
    $Ubuntu1404_1_0_20161208.MarketplaceProductName = "Ubuntu Server 14.04 LTS"
    $Ubuntu1404_1_0_20161208.Publisher = "Canonical"
    $Ubuntu1404_1_0_20161208.Offer = "UbuntuServer"
    $Ubuntu1404_1_0_20161208.SKU = "14.04.5-LTS"
    $Ubuntu1404_1_0_20161208.Version = "1.0.20161208"
    $Ubuntu1404_1_0_20161208.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/Ubuntu1404-20161208-9.vhd"
    $Ubuntu1404_1_0_20161208.OSType = "Linux"

    $CentOS69 = @{}
    $CentOS69.MarketplaceProductName = "CentOS-based 6.9"
    $CentOS69.Publisher = "OpenLogic"
    $CentOS69.Offer = "CentOS"
    $CentOS69.SKU = "6.9"
    $CentOS69.Version = "6.9.20170717"
    $CentOS69.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/OpenLogic-CentOS-69-20170707.vhd"
    $CentOS69.OSType = "Linux"

    $CentOS73 = @{}
    $CentOS73.MarketplaceProductName = "CentOS-based 7.3"
    $CentOS73.Publisher = "OpenLogic"
    $CentOS73.Offer = "CentOS"
    $CentOS73.SKU = "7.3"
    $CentOS73.Version = "7.3.20170925"
    $CentOS73.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/OpenLogic-CentOS-73-20170707.vhd"
    $CentOS73.OSType = "Linux"

    $Debian8 = @{}
    $Debian8.MarketplaceProductName = 'Debian 8 \"Jessie\"'
    $Debian8.Publisher = "credativ"
    $Debian8.Offer = "Debian"
    $Debian8.SKU = "8"
    $Debian8.Version = "8.0.201710090"
    $Debian8.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/Debian8-20171009.vhd"
    $Debian8.OSType = "Linux"

    $Suse11 = @{}
    $Suse11.MarketplaceProductName = "SLES 11 SP4 (BYOS)"
    $Suse11.Publisher = "SUSE"
    $Suse11.Offer = "SLES-BYOS"
    $Suse11.SKU = "11-SP4"
    $Suse11.Version = "2.16.0"
    $Suse11.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/SLES11-SP4-0.2.16-Build2.2-20172308.vhd"
    $Suse11.OSType = "Linux"

    $Suse12 = @{}
    $Suse12.MarketplaceProductName = "SLES 12 SP3 (BYOS)"
    $Suse12.Publisher = "SUSE"
    $Suse12.Offer = "SLES-BYOS"
    $Suse12.SKU = "12-SP3"
    $Suse12.Version = "1.0.5"
    $Suse12.ImageURI = "https://azurestacktemplate.blob.core.windows.net/azurestacktemplate-public-container/SLES12-SP2-0.2.21-Build2.4-20172308.vhd"
    $Suse12.OSType = "Linux"

    $Products.WS2016DTC = $WS2016DTC
    $Products.WS2016DTCCore = $WS2016DTCCore
    $Products.WS2012R2DTC = $WS2012R2DTC
    $Products.CustomScriptExtension = $CustomScriptExtension
    $Products.DscExtension  = $DscExtension
    $Products.Ubuntu1604 = $Ubuntu1604
    $Products.Ubuntu1404 = $Ubuntu1404
    $Products.Ubuntu1404_1_0_20161208 = $Ubuntu1404_1_0_20161208
    $Products.CentOS69 = $CentOS69
    $Products.CentOS73 = $CentOS73
    $Products.Debian8 = $Debian8
    $Products.Suse11 = $Suse11
    $Products.Suse12 = $Suse12

    return $Products.($ImageType.ToString())
}

function Test-TemplateDeploymentBase {
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $SubscriptionUser,

        [Parameter(Mandatory = $true)]
        [String] $UserPassword,

        [String[]] $Services = @("Microsoft.Compute", "Microsoft.Storage", "Microsoft.Network"),

        [Parameter(Mandatory = $true)]
        [String[]] $TemplateFileUrl,

        [String[]] $TemplateParameterFileUrl,

        [Parameter(Mandatory = $true)]
        [bool] $DoNotDelete,

        [bool] $StopVmOnFailure = $false,

        [bool] $VmCreated = $true,

        [String] $TenantRg,

        [String] $AdminRg,

        [String] $SpecifiedOfferName,

        [String] $SpecifiedPlanName,

        [String] $SpecifiedTenantSubscriptionName,

        [bool] $UseExistingOffer = $false,

        [bool] $UseExistingTenantSubscription = $false,

        [string[]] $ExistingRgsToDelete,

        [string[]] $RemoveParameters,

        [hashtable[]] $UpdatedParameterValue,

        [hashtable[]] $AdditionalParameters,

        $Results
    )

    if ($TemplateParameterFileUrl) { $templateParameterFilePresented = $true } else { $templateParameterFilePresented = $false } 

    if(!$SpecifiedOfferName) {
     $offerName = "TestOffer-"  + [Guid]::NewGuid().ToString()
    }
    else {
     $offerName = $SpecifiedOfferName
    }
    if(!$SpecifiedPlanName) {
     $planName = "TestPlan-"  + [Guid]::NewGuid().ToString()
    }
    else {
     $planName = $SpecifiedPlanName
    }
    if(!$AdminRg) {
     $rgName = "TestRG-" + [Guid]::NewGuid().ToString()
    }
    else {
     $rgName = $AdminRg
    }
    if(!$SpecifiedTenantSubscriptionName) {
     $subDisplayName = "$SubscriptionUser" + [Guid]::NewGuid().ToString()
    }
    else {
     $subDisplayName = $SpecifiedTenantSubscriptionName
    }
    $allTimers = @()

    Log-Info "Offer Name: $offerName"
    Log-Info "Plan Name: $planName"
    Log-Info "Offer and plan resource group name: $rgName"
    Log-Info "Tenant subscription display name: $subDisplayName"

    if(!$Results) {
     $Results = @{}
    }
    $Results.VmDeploymentTimesRaw = @{}
    $Results.VmScaleSetTimeRaw = @{}
    $Results.VmDeploymentCount = @{}
    $Results.VmDeploymentCount.Total = 0
    $Results.VmDeploymentCount.Passed = 0
    $Results.VmDeploymentCount.Failed = 0
    $Results.TotalDeploymentTimeInSec = 0


    if($UseExistingOffer -eq $false) {
     Log-Info "Creating resource group $rgName"
     $rgCreated = New-AzureRmResourceGroup -Name $rgName -Location $Global:AzureStackConfig.ArmLocation -Force *>> $Global:wkLogFile
     Log-Info "Done creating resource group $rgName"

     $quotaIds = Get-WkServiceQuotas -Services $Services
     Log-Info "Creating plan $planName"
     $plan = New-AzureRMPlan -Name $planName -DisplayName $planName -ArmLocation $Global:AzureStackConfig.ArmLocation -ResourceGroup $rgName -QuotaIds $quotaIds # *>> $Global:wkLogFile
     Log-Info "Done creating plan $planName"

     Assert-NotNull $plan
     Assert-True {$plan.Properties.DisplayName -eq $planName}

     Log-Info "Creating offer $offerName"
     $offer = New-AzureRMOffer -Name $offerName -DisplayName $offerName -State Private -BasePlanIds @($plan.Id) -ArmLocation $Global:AzureStackConfig.ArmLocation -ResourceGroup $rgName *>> $Global:wkLogFile
     Log-Info "Done creating offer $offerName"

     $offer = Get-AzureRMOffer -Name $OfferName -ResourceGroup $rgName -Managed

     Assert-NotNull $offer
     Assert-True { $offer.Properties.DisplayName -eq $offerName}
     $offer.properties.state = "Public"
     $offer | Set-AzureRMOffer -ResourceGroup $rgName *>> $Global:wkLogFile
    }
    else {
     $offer = Get-AzureRMOffer -Name $OfferName -ResourceGroup $rgName -Managed
    }

    Log-Info "Offer id $($offer.Id)"

    # Creating a subscription for the tenant
    if($UseExistingTenantSubscription -eq $false) {
     Log-Info "Creating new tenant sub $subDisplayName"
     Log-Info "Creating new tenant sub offer $($offer.Id)"
     $subscription = New-AzureRmManagedSubscription -Owner $SubscriptionUser -OfferId $offer.Id -DisplayName $subDisplayName
    }

    Auth-Tenant -TenantName $SubscriptionUser -TenantPassword $UserPassword

    $offer = Get-AzureRmOffer -Provider "Default" | Where-Object Name -EQ $OfferName

    if($TenantRg) {
     $tenantRGName = $TenantRg
    }
    else {
     $tenantRGName = "rg" + (get-date).ToString("ddhhmmss")
    }

    $subscription = Get-AzureRmSubscription -SubscriptionName $subDisplayName
    #$subscription = Get-AzureRmSubscription | Where-Object{$_.name -eq $subDisplayName}
    $subscription | Select-AzureRmSubscription
    Log-Info "Subscription ID: $($subscription.Id)"

    $deploymentFailure = $false

    try {
     # Commented this out to workaround uniqueString function not available for unique name Creations. ResourceGroup Name will currently be less than 8 characters with only lowercase and numbers supported
     #$tenantRGName = "TenantRG-" + [Guid]::NewGuid().ToString()

     Get-AzureRmContext *>> $Global:wkLogFile

     Log-Info "Creating resource group $tenantRGName"
     $curTimer = Start-WkTimer -TimerName "Resource Group Creation $tenantRGName"
     $rgCreated = New-AzureRmResourceGroup -Name $tenantRGName -Location $Global:AzureStackConfig.ArmLocation -Force *>> $Global:wkLogFile
     $allTimers += End-WkTimer -TimerName "Resource Group Creation $tenantRGName" -Timer $curTimer
     Log-Info "Done creating resource group $tenantRGName"

     $curTemplate = 0;
     foreach($template in $TemplateFileUrl) {
         $templateNameElements =  $template.split("\/")
         if($templateNameElements.Count -ge 2) {
             $templateName = $templateNameElements[-2]
         }
         else {
             $templateName = $template
         }
         $deploymentName = $templateName + "-Deployment"
         Log-Info "Template to deploy: $templateName"

         $templateFile = Download-File -FileUrl $template
         Log-Info ("Template File Location: {0}" -f $templateFile)
         Write-Verbose "Template file $templateFile"

        if ($templateParameterFilePresented) {
         $templateParameterFile = Download-File -FileUrl $TemplateParameterFileUrl[$curTemplate]
         Log-Info ("Template parameter File Location: {0}" -f $templateParameterFile)
         Write-Verbose "Template param file $templateParameterFile"
         Replace-MaskCharacter -FilePath $templateParameterFile
         Replace-PasswordPlaceholder -FilePath $templateParameterFile

         if(($UpdatedParameterValue -ne $null) -and $UpdatedParameterValue.Count -gt 0) {
             if($UpdatedParameterValue[$curTemplate]) {
                 $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                 foreach($key in $UpdatedParameterValue[$curTemplate].Keys) {
                     #$json.parameters.$key.value = $UpdatedParameterValue.$key
                     $value = $UpdatedParameterValue[$curTemplate].$key
                     $entry = @{
                         value = $value
                     }
                     $json.parameters | Add-Member -Type "NoteProperty" -Name $key -Value $entry -Force
                 }
                 ConvertTo-Json $json | Out-File $templateParameterFile
             }
         }

         if(($AdditionalParameters -ne $null) -and $AdditionalParameters.Count -gt 0) {
             if($AdditionalParameters[$curTemplate]) {
                 Log-Info "Adding additional paramters to template file"
                 $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                 foreach($key in $AdditionalParameters[$curTemplate].Keys) {
                     Log-Info "Adding value $($AdditionalParameters[$curTemplate].$key) to key $key"
                     $newPair = New-Object -TypeName PSObject
                     $keyValue = @{"value" = $AdditionalParameters[$curTemplate].$key}
                     #$newValue = [int]$($AdditionalParameters[$curTemplate].$key)
                     $newValue = $($AdditionalParameters[$curTemplate].$key)
                     $newPair | Add-Member -PassThru NoteProperty "value" $newValue

                     $json.parameters | Add-Member -PassThru NoteProperty $key $newPair
                     #$json.parameters.$key | add-member -PassThru NoteProperty value $AdditionalParameters[$curTemplate].$key
                 }
                 Log-Info $json
                 ConvertTo-Json $json | Out-File $templateParameterFile
             }
         }

         if(($RemoveParameters -ne $null) -and $RemoveParameters.Count -gt 0) {
             Log-Info "Removing paramters from template file"
             $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

             foreach($param in $RemoveParameters) {
                 $json.parameters = $json.parameters | Select-Object * -ExcludeProperty $param
             }
             Log-Info $json
             ConvertTo-Json $json | Out-File $templateParameterFile
         }

         $paramFileContent = [IO.File]::ReadAllText($templateParameterFile)
     }

        $templateFileContent = [IO.File]::ReadAllText($templateFile)

         Log-Info "Parameter file content:"
         #Log-Info "$paramFileContent"
         $paramFileContent *>> $Global:wkLogFile
         Log-Info "Template file content:"
         $templateFileContent *>> $Global:wkLogFile
         #Log-Info "$templateFileContent"

         #Log-Info ("Parameter file content: {0}" -f ([IO.File]::ReadAllText($templateParameterFile)))
         #Log-Info ("Template file content: {0}" -f ([IO.File]::ReadAllText($templateFile)))
         #test the template and parameters file
         try {
             if ($templateParameterFilePresented) {
                 Test-AzureRmResourceGroupDeployment -ResourceGroupName $tenantRGName -TemplateParameterFile $templateParameterFile -TemplateFile $templateFile
             } else {
                 Test-AzureRmResourceGroupDeployment -ResourceGroupName $tenantRGName -TemplateFile $templateFile
             }
         }
         catch {
             Write-Error "Template validation failed on $templateFile $templateParameterFile $_"
             throw $_
         }

         Log-Info "Starting resource group deployment $deploymentName"
         $curTimer = Start-WkTimer -TimerName "New Resource Group Deployment $templateName"

         if ($templateParameterFilePresented) {
             New-AzurermResourceGroupDeployment -Name $deploymentName -ResourceGroupName $tenantRGName -TemplateFile $templateFile -TemplateParameterFile $templateParameterFile -Verbose *>> $Global:wkLogFile
         } else {
             New-AzurermResourceGroupDeployment -Name $deploymentName -ResourceGroupName $tenantRGName -TemplateFile $templateFile -Verbose *>> $Global:wkLogFile
         }

         $Results.TotalDeploymentTimeInSec = [int]((Get-Date) - $curTimer).TotalSeconds
         $allTimers += End-WkTimer -TimerName "New Resource Group Deployment $templateName" -Timer $curTimer
         Log-Info "Resource group deployment finished on $deploymentName"

         # Check results of deployment, throw if there is a failure.
         # New-AzurermResourceGroupDeployment does not throw on all errors in deployment
         Log-Info "Deployment table for deployment: $deploymentName"
         $deployRes = Get-AzureRmResourceGroupDeploymentOperation -DeploymentName $deploymentName -ResourceGroupName $tenantRGName -Verbose

         $null = Log-DeploymentTableAndErrors -DeploymentResource $deployRes

         $tableLogged = $true
         $creationFailed = $false

        foreach ($res in $deployRes) {
         if ($res.Properties.TargetResource.ResourceType -eq "Microsoft.Compute/virtualMachines") {
             $Results.VmDeploymentTimesRaw.$($res.Properties.TargetResource.ResourceName) = $res.Properties.Duration
             $Results.VmDeploymentCount.Total++

             if ($res.Properties.StatusCode -eq "OK") {
                 $Results.VmDeploymentCount.Passed++
             }
             else {
                 $Results.VmDeploymentCount.Failed++
             }
         }

         if ($res.Properties.TargetResource.ResourceType -eq "Microsoft.Compute/virtualMachineScaleSets") {
             $Results.VmScaleSetTimeRaw.$($res.Properties.TargetResource.ResourceName) = $res.Properties.Duration
         }

         if ($res.Properties.StatusCode -ne "OK" -and $res.Properties.StatusCode -ne "Created") {
             $creationFailed = $true
         }
     }

         if ($creationFailed) {
             $deploymentFailure = $true
             if($StopVmOnFailure){
                 Log-Info "Stopping VM for Failure"
                 $DoNotDelete = $true
             }

             $errMsg = "Deployment failed. See deployment table for detailed information."

             Log-Error  $errMsg
             throw $errMsg
         }
        $curTemplate++
    }
    }
    finally {
     if($tableLogged -eq $false) {
         try 
         {
             $deployRes = Get-AzureRmResourceGroupDeploymentOperation -DeploymentName $deploymentName -ResourceGroupName $tenantRGName -Verbose
         }
         catch {
             Log-Error "Failed to get deployment table. Deployment might not have started"
             Log-Error "$_"
         }

         $null = Log-DeploymentTableAndErrors -DeploymentResource $deployRes
     }
     if($VmCreated -eq $true) {
         try {
             $vms =  Get-AzureRmVM -ResourceGroupName $tenantRGName
             foreach($vmname in $vms.Name) {
                 $status = Get-AzureRmVM -ResourceGroupName $tenantRGName -Status -Name $vmname
                 Log-Info $status.Name
                 Log-Info $status.ExtensionsText
                 Log-Info $status.StatusesText
                 Log-Info $status.BootDiagnosticsText
                 Log-Info $status.DisksText
                 Log-Info $status.VMAgentText
             }
          }
          catch {
             $deploymentFailure = $true
             if($StopVmOnFailure){
                 Log-Info "Stopping VM for Failure"
                 $DoNotDelete = $true
             }
             Log-Error "Failed to get VMs. No VMs may have been created"
             Log-Error "$_"
         }
     }

     # Delete the resource group in the tenant subscription context
     if (!$DoNotDelete) {
         Log-Info "Removing resource group $tenantRGName"
         $curTimer = Start-WkTimer -TimerName "Remove Resource Group $tenantRGName"
         Remove-AzureRmResourceGroup -Name $tenantRGName -Force *>> $Global:wkLogFile
         $allTimers += End-WkTimer -TimerName "Remove Resource Group $tenantRGName" -Timer $curTimer
         Log-Info "Done removing resource group $tenantRGName"
         if($ExistingRgsToDelete) {
             foreach($rg in $ExistingRgsToDelete) {
                 Log-Info "Removing resource group $rg"
                 $curTimer = Start-WkTimer -TimerName "Remove Resource Group $rg"
                 Remove-AzureRmResourceGroup -Name $rg -Force *>> $Global:wkLogFile
                 $allTimers += End-WkTimer -TimerName "Remove Resource Group $rg" -Timer $curTimer
                 Log-Info "Done removing resource group $rg"
             }
         }

         # Make a best effort attempt to remove resource providers
         try {
             Log-Info "Removing resource providers"
             foreach($rp in $Services) {
                 Log-Info "Unregistering provider $rp"
                 Unregister-AzureRmResourceProvider  -ProviderNamespace $rp *>> $Global:wkLogFile
             }
             Log-Info "Waiting for providers to show as unregistered"
             # wait for unregistration to complete
             $retryAttemps = 0
             $numUnregistrerRetry = 18
             $numUnregistrerDelaySec = 10
             $unregisterComplete = $false
             $providers = $null
             while($retryAttemps -lt $numUnregistrerRetry) {
                 $providers = Get-AzureRMResourceProvider *>> $Global:wkLogFile
                 if($providers.Count -ne 0) {
                     Start-Sleep -s $numUnregistrerDelaySec
                     $retryAttemps++
                 }
                 else {
                     $unregisterComplete = $true
                     break;
                 }
             }
             if($unregisterComplete -eq $false) {
                 Log-Warning "All providers did not unregister. This may cause further cleanup problems"

                 foreach($provider in $providers) {
                     Log-Info "$provider.ProviderNamespace"
                 }
             }
         }
         catch {
             Log-Warning "Failed to remove resource providers."
             Log-Warning "$_"
         }
     }
     if($StopVmOnFailure -and $deploymentFailure){
         Log-Info "Stopping VM"
         Stop-VmOnFailure -resourceGroup $tenantRGName
     }

     Auth-Admin -AdminName $Global:DefaultAdminUser -AdminPassword $UserPassword
    }

    if (!$DoNotDelete) {
         if($UseExistingTenantSubscription -eq $true) {
             $subscription = Get-AzureRmManagedSubscription | Where-Object {$_.DisplayName -eq $subDisplayName}
         }

         $curTimer = Start-WkTimer -TimerName "Remove Subscription"
         Remove-WkSubscription -TargetSubscriptionId $subscription.SubscriptionId
         $allTimers += End-WkTimer -TimerName "Remove Subscription" -Timer $curTimer

         if($UseExistingOffer -eq $true) {
             $offer = Get-AzureRmOffer | Where-Object {$_.Name -eq $offerName}
             $curTimer = Start-WkTimer -TimerName "Remove Offer"
             # HACK Commenting out offer deletion till we land a solution for subscription deletion
             #Remove-AzureRMOffer -Name $offerName -ResourceGroup $rgName *>> $Global:wkLogFile
             $allTimers += End-WkTimer -TimerName "Remove Offer" -Timer $curTimer

             # TODO will removing the resource group remove the plan and offer?
             Log-Info "Removing resource group $rgName"

             $curTimer = Start-WkTimer -TimerName "Remove Admin ResourceGroup"
             #HACK Commenting out resource group deletion till we land a solution for subscription deletion
             #Remove-AzureRmResourceGroup -Name $rgName -Force *>> $Global:wkLogFile
             $allTimers += End-WkTimer -TimerName "Remove Admin ResourceGroup" -Timer $curTimer

             Log-Info "Done removing resource group $rgName"
         }
         else {
             $curTimer = Start-WkTimer -TimerName "Remove Offer"
             #HACK Commenting out offer deletion till we land a solution for subscription deletion
             #Remove-AzureRMOffer -Name $offerName -ResourceGroup $rgName  *>> $Global:wkLogFile
             $allTimers += End-WkTimer -TimerName "Remove Offer" -Timer $curTimer

             $curTimer = Start-WkTimer -TimerName "Remove Plan"
             #HACK Commenting out plan deletion till we land a solution for subscription deletion
             #Remove-AzureRMPlan -Name $planName -ResourceGroup $rgName *>> $Global:wkLogFile
             $allTimers += End-WkTimer -TimerName "Remove Plan" -Timer $curTimer

             Log-Info "Removing resource group $rgName"
             $curTimer = Start-WkTimer -TimerName "Remove Admin ResourceGroup"
             #HACK Commenting out resource group deletion till we land a solution for subscription deletion
             #Remove-AzureRmResourceGroup -Name $rgName -Force *>> $Global:wkLogFile
             $allTimers += End-WkTimer -TimerName "Remove Admin ResourceGroup" -Timer $curTimer

             Log-Info "Done removing resource group $rgName"
         }
    }

    Log-Timer -Timers $allTimers -TableName "Template Deployment"
    return $results
}

Function Download-File
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $FileUrl,

        [Parameter(Mandatory=$false)]
        [String] $OutputPath
    )

    $retries = 20
    $lastException = $null
    $success = $false

    if(Test-Path -Path $FileUrl)
    {
        if(!$OutputPath)
        {
            $OutputPath = Join-Path $ENV:TEMP (New-Guid).ToString()
        }
        
        Log-Info "local path detected. Copying to $OutputPath"
        
        $array = $FileUrl.Split('/\')
        $fileName = $array[$array.Length-1]
        New-Item $OutputPath -ItemType Directory| Out-Null
        Copy-Item $FileUrl $OutputPath | Out-Null
        return "$OutputPath\$fileName"
    }
    while($success -eq $false -and $retries -ge 0)
    {
        $success = $true
        try
        {
            $array = $FileUrl.Split('/')
            $fileName = $array[$array.Length-1]

            if(!$OutputPath)
            {
                $OutputPath = Join-Path $ENV:TEMP (New-Guid).ToString()
            }

            if(!(Test-Path $OutputPath))
            {
                New-Item -Path $OutputPath -ItemType Directory -Force | Out-Null
            }

            $fileName = Join-Path $OutputPath $fileName

            Log-Info "Start to download file from '$FileUrl' to '$fileName'"
            $wc = New-Object System.Net.WebClient
            $wc.DownloadFile($FileUrl, $fileName) | Out-Null
        }
        catch
        {
            $success = $false
            $lastException = $_
            Log-Info "Download of $FileURl failed with exception $_"
        }
        $retries--
        if($success -eq $false)
        {
            Log-Info "Failed to download $FileUrl. Retrying $retries more times"
            Start-Sleep -Seconds 10
        }
    }

    if($success -eq $false)
    {
        Log-Error "Timed out trying to download $FileUrl"
        throw $lastException
    }

    Log-Info "Completed downloading file from '$FileUrl'"
    return $fileName
}


Function Replace-MaskCharacter
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $FilePath,

        [String] $MaskCharacter = "####"
    )

    $randomCharacters = "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" | Get-Random -Count $MaskCharacter.Length
    $replaceString = ""
    foreach($c in $randomCharacters)
    {
        $replaceString += $c
    }

    Replace-Placeholder -FilePath $FilePath -Placeholder $MaskCharacter -Value $replaceString
}

Function Replace-Placeholder
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $FilePath,
        [Parameter(Mandatory=$true)]
        [String] $Placeholder,
        [Parameter(Mandatory=$true)]
        [String] $Value
    )

    $fileContent = [IO.File]::ReadAllText($FilePath)
    $fileContent = $fileContent.Replace($Placeholder,$Value);
    Set-Content -Value $fileContent -Path $FilePath
}

Function Add-Parameter
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $FilePath,
        [Parameter(Mandatory=$true)]
        [String] $Placeholder,
        [Parameter(Mandatory=$true)]
        [String] $Value
    )

    $fileContent = [IO.File]::ReadAllText($FilePath)
    $fileContent = $fileContent.Replace($Placeholder,$Value);
    Set-Content -Value $fileContent -Path $FilePath
}

Function New-StrongPassword
{
    param
    (
        [int] $PasswordLength = 12
    )

    Add-Type -AssemblyName System.Web
    $password = [System.Web.Security.Membership]::GeneratePassword($PasswordLength - 4, 3)
    # need to ensure there is a number, a special character, an upper case character, and a lower case character
    $lowerCase = "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z" | Get-Random -Count 1
    $upperCase = "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z" | Get-Random -Count 1
    $number = "0","1","2","3","4","5","6","7","8","9" | Get-Random -Count 1
    $special = "!","@","#","$","%","^","*","(",")" | Get-Random -Count 1
    $password = $password + $lowerCase + $upperCase + $number + $special
    $password
}

Function Replace-PasswordPlaceholder
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $FilePath,
        [String] $Placeholder = "GEN-PASSWORD",
        [int] $PasswordLength = 10
    )

    $password = New-StrongPassword -PasswordLength $PasswordLength
    Replace-Placeholder -FilePath $FilePath -Placeholder $Placeholder -Value $password
}

function Start-WkTimer
{
   param
    (
        [Parameter(Mandatory=$true)]
        [String] $TimerName

    )
    return Get-Date
}

function End-WkTimer
{
   param
    (
        [Parameter(Mandatory=$true)]
        [String] $TimerName,

        [Parameter(Mandatory=$true)]
        $Timer
    )
    $endTime = Get-Date
    $elapsedTime = $endTime - $Timer
    $res = @{$TimerName = $elapsedTime}

    return $res
}

function Log-Timer
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $TableName,

        [Parameter(Mandatory=$true)]
        $Timers
    )
    Log-Info "*************************************************************************************"
    Log-Info "* Timers for run $TableName (dd:hh:mm:ss)"
    Log-Info "*************************************************************************************"
    foreach($timer in $Timers)
    {
        $outStr =  $($timer.Keys).PadRight(70) + "| "
        $outStr += "{0:dd}:{0:hh}:{0:mm}:{0:ss} |" -f $($timer.Values)
        Log-Info $outStr
    }
    Log-Info "*************************************************************************************"
    Log-Info "* End timers for run $TableName"
    Log-Info "*************************************************************************************"

}

function Log-Info
{    param
    (
        [Parameter(Mandatory=$false)]
        [String] $LogMessage
    )

    $date = Get-Date
    Write-Verbose $LogMessage -Verbose

    if($Global:wkLogFile)
    {
        $finalLogMessage = "$date" + " [INFO ] " + $LogMessage
        $finalLogMessage | Out-File $Global:wkLogFile  -Append -Width 10000
    }
}

function Log-Error
{
    param
    (
        [Parameter(Mandatory=$false)]
        [String] $LogMessage
    )

    $date = Get-Date

    $finalLogMessage = "$date" + " [ERROR] " + $LogMessage

    $finalLogMessage | Out-File $Global:wkLogFile -Append -Width 10000
    $errorEnd = "-Errors.log"
    if($Global:wkLogFile.EndsWith(".log"))
    {
        $errLog = $Global:wkLogFile.Trim(".log")
        $errLog += $errorEnd
    }
    else
    {
        $errLog = $Global:wkLogFile + $errorEnd
    }

    if($Global:wkLogFile)
    {
        $finalLogMessage | Out-File $errLog -Append -Width 10000
    }

    # Log to Console
    Write-Host $finalLogMessage -ErrorAction Continue
}

function Log-Warning
{
    param
    (
        [Parameter(Mandatory=$false)]
        [String] $LogMessage
    )

    $date = Get-Date

    $finalLogMessage = "$date" + " [WARN ] " + $LogMessage

    if($Global:wkLogFile)
    {
        $finalLogMessage | Out-File $Global:wkLogFile  -Append -Width 10000
    }
    # Log to Console
    Write-Warning $finalLogMessage -ErrorAction Continue

}

function Get-WkStorageDefaultQuota
{
    # Assumption - RP location is same as ARM
    # Idempotent PUT call, creates it if does not exist
    $quotaName = "NewStorageQuota1"
    $quotaQueryName = $Global:AzureStackConfig.ArmLocation +  "/" + $quotaName
    $id = ""

    try
    {
        Log-Info "Getting default storage quota."
        $quota = Get-AzureRmResource -ResourceType "Microsoft.Storage.Admin/locations/quotas" -ResourceName $quotaQueryName
    }
    catch
    {
        Log-Info "No storage quota found. Creating."
    }

    if(!$quota)
    {
        Log-Info "Creating Storage quota."
        $quota = New-WkStorageQuota -QuotaName $quotaName -Location $Global:AzureStackConfig.ArmLocation
        $id = $quota.Id
    }
    else
    {
        $id = $quota.ResourceId
    }

    Write-Output $id
}

function Get-WkComputeDefaultQuota
{
    # Assumption - RP location is same as ARM
    # Idempotent PUT call, creates it if does not exist
    $quotaName = "NewComputeQuota1"
    $quotaQueryName = $Global:AzureStackConfig.ArmLocation +  "/" + $quotaName

    try
    {
        Log-Info "Getting default compute quota."
        $quota = Get-AzureRmResource -ResourceType "Microsoft.Compute.Admin/locations/quotas" -ResourceName $quotaQueryName
    }
    catch
    {
        Log-Info "No compute quota found. Creating."
    }
    if(!$quota)
    {
        Log-Info "Creating Compute quota."
        $quota = New-WkComputeQuota -QuotaName $quotaName -Location $Global:AzureStackConfig.ArmLocation
        $id = $quota.Id
    }
    else
    {
        $id = $quota.ResourceId
    }

    Write-Output $id
}

function Get-WkNetworkDefaultQuota
{
    # Assumption - RP location is same as ARM
    # Idempotent PUT call, creates it if does not exist
    $quotaName = "NewNetworkQuota1"
    $quotaQueryName = $Global:AzureStackConfig.ArmLocation +  "/" + $quotaName

    try
    {
        Log-Info "Getting default network quota."
        $quota = Get-AzureRmResource -ResourceType "Microsoft.Network.Admin/locations/quotas" -ResourceName $quotaQueryName
    }
    catch
    {
        Log-Info "No network quota found. Creating."
    }
    if(!$quota)
    {
        Log-Info "Creating network quota."
        $quota = New-WkNetworkQuota -QuotaName $quotaName -Location $Global:AzureStackConfig.ArmLocation
        $id = $quota.Id
    }
    else
    {
        $id = $quota.ResourceId
    }

    Write-Output $id
}

function Get-KeyvaultDefaultQuota
{
    $getKeyvaultQuota = @{
        Uri = "{0}subscriptions/{1}/providers/Microsoft.Keyvault.Admin/locations/{2}/quotas?api-version=2014-04-01-preview" -f $Global:AzureStackConfig.AdminUri, $Global:AzureStackConfig.SubscriptionId, $Global:AzureStackConfig.ArmLocation
        Method = "GET"
        Headers = @{ "Authorization" = "Bearer " + $Global:AzureStackConfig.Token }
        ContentType = "application/json"
    }

    Log-Info "Getting default keyvault quota."
    # keyvault Creates only one default quota 'unlimited' as part of the deployment, just get that
    $keyvaultQuota = Invoke-RestMethod @getKeyvaultQuota

    Write-Output $keyvaultQuota.value.Id
}

# Defaults set to max
function New-WkComputeQuota
{
    param
    (
        [parameter(Mandatory=$true)]
        [string] $QuotaName,

        [parameter(Mandatory=$true)]
        [string] $Location,

        [int] $VirtualMachineCount = 10000,

        [int] $MemoryLimitMB = 100000,

        [int] $CoresLimit = 10000,

		[int] $VmScaleSetCount = 2000,

		[int] $AvailabilitySetCount = 2000,

        [string] $ApiVersion = "2015-12-01-preview"
    )

    Log-Info "Creating compute quota named $QuotaName"

    $uri = "{0}subscriptions/{1}/providers/Microsoft.Compute.Admin/locations/{2}/quotas/{3}?api-version={4}" -f $Global:AzureStackConfig.AdminUri, $Global:AzureStackConfig.SubscriptionId, $Location, $QuotaName, $ApiVersion

    $RequestBody = @"
    {
        "name":"$quotaName",
        "type":"Microsoft.Compute.Admin/quotas",
        "location":"$Location",
        "properties":{
            "virtualMachineCount":$VirtualMachineCount,
            "memoryLimitMB":$MemoryLimitMB,
            "coresLimit":$CoresLimit,
			"availabilitySetCount":$AvailabilitySetCount,
			"vmScaleSetCount":$VmScaleSetCount
        }
    }
"@

    $headers = @{ "Authorization" = "Bearer "+ $Global:AzureStackConfig.Token }

    $quota = Invoke-RestMethod -Method Put -Uri $uri -Body $RequestBody -ContentType 'application/json' -Headers $headers

    Write-Output $quota
}


# Defaults set to max
function New-WkNetworkQuota
{
    param(
        [parameter(Mandatory=$true)]
        [string] $Location,

        [parameter(Mandatory=$true)]
        [string] $QuotaName,

        [int] $PublicIpsPerSubscription = 60,
        [int] $VNetsPerSubscription = 500,
        [int] $GatewaysPerSubscription = 50,
        [int] $ConnectionsPerSubscription = 1000,
        [int] $LoadBalancersPerSubscription = 100,
        [int] $NicsPerSubscription = 10000,
        [int] $SecurityGroupsPerSubscription = 400,
        [string] $ApiVersion = "2015-06-15"
    )

    $uri = "{0}/subscriptions/{1}/providers/Microsoft.Network.Admin/locations/{2}/quotas/{3}?api-version={4}" -f $Global:AzureStackConfig.AdminUri, $Global:AzureStackConfig.SubscriptionId, $Location, $QuotaName, $ApiVersion
    $id = "/subscriptions/{0}/providers/Microsoft.Network.Admin/locations/{1}/quotas/{2}" -f  $Global:AzureStackConfig.SubscriptionId, $Location, $QuotaName

    $RequestBody = @"
    {
        "id":"$id",
        "name":"$quotaName",
        "type":"Microsoft.Network.Admin/quotas",
        "location":"$Location",
        "properties":{
            "maxPublicIpsPerSubscription":$PublicIpsPerSubscription,
            "maxVnetsPerSubscription":$VNetsPerSubscription,
            "maxVirtualNetworkGatewaysPerSubscription":$GatewaysPerSubscription,
            "maxVirtualNetworkGatewayConnectionsPerSubscription":$ConnectionsPerSubscription,
            "maxLoadBalancersPerSubscription":$LoadBalancersPerSubscription,
            "maxNicsPerSubscription":$NicsPerSubscription,
            "maxSecurityGroupsPerSubscription":$SecurityGroupsPerSubscription,
        }
    }
"@
    $headers = @{ "Authorization" = "Bearer "+ $Global:AzureStackConfig.Token }

    $quota = Invoke-RestMethod -Method Put -Uri $uri -Body $RequestBody -ContentType 'application/json' -Headers $headers

    Write-Output $quota
}

# Defaults set to max
function New-WkStorageQuota
{
    param(
        [parameter(Mandatory=$true)]
        [string] $QuotaName,

        [parameter(Mandatory=$true)]
        [string] $Location,
        [int] $CapacityInGb = 500000,
        [int] $NumberOfStorageAccounts = 200,
        [string] $ApiVersion = "2015-12-01-preview"
    )

    $uri = "{0}subscriptions/{1}/providers/Microsoft.Storage.Admin/locations/{2}/quotas/{3}?api-version={4}" -f $Global:AzureStackConfig.AdminUri, $Global:AzureStackConfig.SubscriptionId, $Location, $QuotaName, $ApiVersion

    $RequestBody = @"
    {
        "name":"$quotaName",
        "location":"$LocationName",
        "properties": {
            "capacityInGb": $CapacityInGb,
            "numberOfStorageAccounts": $NumberOfStorageAccounts
        }
    }
"@
    $headers = @{ "Authorization" = "Bearer "+ $Global:AzureStackConfig.Token }

    Invoke-RestMethod -Method Put -Uri $uri -Body $RequestBody -ContentType 'application/json' -Headers $headers
}

function Get-WkSubscriptionsDefaultQuota
{
    $getSubscriptionsQuota = @{
        Uri = "{0}subscriptions/{1}/providers/Microsoft.Subscriptions.Admin/locations/{2}/quotas?api-version=2015-11-01" -f $Global:AzureStackConfig.AdminUri, $Global:AzureStackConfig.SubscriptionId, $Global:AzureStackConfig.ArmLocation
        Method = "GET"
        Headers = @{ "Authorization" = "Bearer " + $Global:AzureStackConfig.Token }
        ContentType = "application/json"
    }

    $subscriptionsQuota = Invoke-RestMethod @getSubscriptionsQuota

    Write-Output $subscriptionsQuota.value.Id
}


function Get-WkServiceQuotas
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String[]] $Services
    )

    $serviceQuotas = @()

    foreach ($service in $Services)
    {
       switch($service)
       {
            "Microsoft.Storage" {
                        $serviceQuotas  += Get-WkStorageDefaultQuota
                    }
            "Microsoft.Compute" {
                        $serviceQuotas  += Get-WkComputeDefaultQuota
                    }
            "Microsoft.Network" {
                        $serviceQuotas  += Get-WkNetworkDefaultQuota
                    }
            "Microsoft.Keyvault" {
                        $serviceQuotas  += Get-WkKeyvaultDefaultQuota
                    }
            Default { throw "Wrong service name provided" }
       }
    }

    return $serviceQuotas
}

function Remove-WkSubscription
{
   param
   (
       [Parameter(Mandatory=$true)]
       [String] $TargetSubscriptionId
   )
    Log-Info "Deleting the subscription : $TargetSubscriptionId"

    $subscription = Get-AzureRmManagedSubscription -TargetSubscriptionId $TargetSubscriptionId
    $subscription.State = "disabled"

    Set-AzureRMManagedSubscription -Subscription $subscription
    Retry-Function -ScriptBlock {(Get-AzureRmManagedSubscription -TargetSubscriptionId $subscription.SubscriptionId).State -ieq "Disabled"} -MaxTries 12 -IntervalInSeconds 5
    Log-Info "Firing request to remove subscription $TargetSubscriptionId"
    Remove-AzureRmManagedSubscription -TargetSubscriptionId $TargetSubscriptionId   *>> $Global:wkLogFile
    # Commenting out the verification as the subscription deletion could take as much as 10 mins and we dont want to wait 10 mins for each tests
    #Log-Info "Verifying subscription is $TargetSubscriptionId deleted"
    #Assert-SubscriptionDeletion {Get-AzureRmManagedSubscription -TargetSubscriptionId $TargetSubscriptionId}
    Log-Info "Successfully fired the request to delete the subscription : $TargetSubscriptionId"
}


function Auth-Tenant
{
    param
    (
        [Parameter(Mandatory=$true)]
        [string] $TenantName,

        [Parameter(Mandatory=$true)]
        [string] $TenantPassword,

        [Parameter(Mandatory=$false)]
        [string] $SubId,

        [Parameter(Mandatory=$false)]
        [string] $subName
    )
    Log-Info "Autheticating to Azure Stack as tenant user"

    $password = ConvertTo-SecureString $TenantPassword -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($TenantName, $password)

    $azureEnv = Get-AzureRmEnvironment -Name "AzureStack Tenant"

    Add-AzureRmAccount -Environment $azureEnv -Credential $credential -TenantId $Global:AadTenantId *>> $Global:wkLogFile

    if($subId)
    {
        Select-AzureRmSubscription -SubscriptionId $SubId *>> $Global:wkLogFile
    }
    if($subName)
    {

        Select-AzureRmSubscription -SubscriptionName  $SubName
    }
}

function Auth-Admin
{
    param
    (
        [Parameter(Mandatory=$true)]
        [string] $AdminName,

        [Parameter(Mandatory=$true)]
        [string] $AdminPassword
    )
    Log-Info "Autheticating to Azure Stack as service admin"

    $password = ConvertTo-SecureString $AdminPassword -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($AdminName, $password)

    $azureEnv = Get-AzureRmEnvironment -Name "AzureStack Admin"

    $res = Add-AzureRmAccount -Environment $azureEnv -Credential $credential -TenantId $Global:AadTenantId *>> $Global:wkLogFile

    Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription" | Set-AzureRmContext *>> $Global:wkLogFile

}

function Test-WkDeployTemplate
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $AdminUser,

        [Parameter(Mandatory=$true)]
        [String] $AdminPassword,

        [Parameter(Mandatory=$true)]
        [String] $TenantUser,

        [Parameter(Mandatory=$true)]
        [String] $TenantPassword,

        [Parameter(Mandatory=$true)]
        [String[]] $TemplateFileUrl,

        [Parameter(Mandatory=$true)]
        [String[]] $TemplateParameterFileUrl,

        [Parameter(Mandatory=$true)]
        [bool] $DoNotDelete,

        [Parameter(Mandatory=$true)]
        $PlanData,

        [bool] $VmCreated = $true,

        [String] $TenantRg,

        [String] $SpecifiedTenantSubscriptionName,

        [bool] $UseExistingTenantSubscription = $false,

        [string[]] $RemoveParameters,

        [hashtable[]] $UpdatedParameterValue,

        [hashtable[]] $AdditionalParameters,

        $Results
    )

    if(!$SpecifiedTenantSubscriptionName)
    {
        $subDisplayName = "$SubscriptionUser" + [Guid]::NewGuid().ToString()
    }
    else
    {
        $subDisplayName = $SpecifiedTenantSubscriptionName
    }
    $allTimers = @()
    if(!$Results)
    {
        $Results = @{}
    }
    $Results.VmDeploymentTimesRaw = @{}

    try
    {
        # Creating a subscription for the tenant
        if($UseExistingTenantSubscription -eq $false)
        {
            Log-Info "Creating new tenant sub $subDisplayName"
            Log-Info "Creating new tenant sub offer $($PlanData.offer.Id)"
            $subscription = New-AzureRmManagedSubscription -Owner $TenantUser -OfferId $PlanData.offer.Id -DisplayName $subDisplayName
        }

    }
    catch
    {
        Log-Error "Failed to create subscription for tenant user $_"
        throw $_
    }

    Auth-Tenant -TenantName $TenantUser -TenantPassword $TenantPassword

    # need to get offer object in tenant context
    try
    {
        #Don't need this?
        #$offer = Get-AzureRmOffer -Provider "Default" | Where-Object Name -EQ $PlanData.offer.Name

        if($TenantRg)
        {
            $tenantRGName = $TenantRg
        }
        else
        {
            $tenantRGName = "rg" + (get-date).ToString("ssffffff")
        }
        $Results.tenantRg = $tenantRGName

        $subscription = Get-AzureRmSubscription -SubscriptionName $subDisplayName
        $Results.tenantSub = $subscription
        #$subscription = Get-AzureRmSubscription | Where-Object{$_.name -eq $subDisplayName}
        $subscription | Select-AzureRmSubscription | Out-File $Global:wkLogFile -Append
        Log-Info "Subscription ID: $($subscription.Id)"
    }
    catch
    {
        Log-Error "Failed to get tenant subscription $_"
        throw $_
    }

    try
    {
        Get-AzureRmContext *>> $Global:wkLogFile

        Log-Info "Creating resource group $tenantRGName"
        $curTimer = Start-WkTimer -TimerName "Resource Group Creation $tenantRGName"
        $rgCreated = New-AzureRmResourceGroup -Name $tenantRGName -Location $Global:AzureStackConfig.ArmLocation -Force *>> $Global:wkLogFile
        $allTimers += End-WkTimer -TimerName "Resource Group Creation $tenantRGName" -Timer $curTimer
        Log-Info "Done creating resource group $tenantRGName"

        $curTemplate = 0;
        foreach($template in $TemplateFileUrl)
        {

            $templateNameElements =  $template.split("\/")
            if($templateNameElements.Count -ge 2)
            {
                $templateName = $templateNameElements[-2]
            }
            else
            {
                $templateName = $template
            }
            $deploymentName = $templateName + "-Deployment"
            Log-Info "Template to deploy: $templateName"

            $templateFile = Download-File -FileUrl $template
            Log-Info ("Template File Location: {0}" -f $templateFile)
            Write-Verbose "Template file $templateFile"
            $templateParameterFile = Download-File -FileUrl $TemplateParameterFileUrl[$curTemplate]
            Log-Info ("Template parameter File Location: {0}" -f $templateParameterFile)
            Write-Verbose "Template param file $templateParameterFile"
            Replace-MaskCharacter -FilePath $templateParameterFile
            Replace-PasswordPlaceholder -FilePath $templateParameterFile

            if(($UpdatedParameterValue -ne $null) -and $UpdatedParameterValue.Count -gt 0)
            {
                if($UpdatedParameterValue[$curTemplate])
                {
                    $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                    foreach($key in $UpdatedParameterValue[$curTemplate].Keys)
                    {
                        #$json.parameters.$key.value = $UpdatedParameterValue.$key
                        $value = $UpdatedParameterValue[$curTemplate].$key
                        $entry = @{
                            value = $value
                        }
                        $json.parameters | Add-Member -Type "NoteProperty" -Name $key -Value $entry -Force
                    }
                    ConvertTo-Json $json | Out-File $templateParameterFile
                }
            }

            if(($AdditionalParameters -ne $null) -and $AdditionalParameters.Count -gt 0)
            {
                if($AdditionalParameters[$curTemplate])
                {
                    Log-Info "Adding additional paramters to template file"
                    $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                    foreach($key in $AdditionalParameters[$curTemplate].Keys)
                    {
                        Log-Info "Adding value $($AdditionalParameters[$curTemplate].$key) to key $key"
                        $newPair = New-Object -TypeName PSObject
                        $keyValue = @{"value" = $AdditionalParameters[$curTemplate].$key}
                        #$newValue = [int]$($AdditionalParameters[$curTemplate].$key)
                        $newValue = $($AdditionalParameters[$curTemplate].$key)
                        $newPair | Add-Member -PassThru NoteProperty "value" $newValue

                        $json.parameters | Add-Member -PassThru NoteProperty $key $newPair
                        #$json.parameters.$key | add-member -PassThru NoteProperty value $AdditionalParameters[$curTemplate].$key
                    }
                    Log-Info $json
                    ConvertTo-Json $json | Out-File $templateParameterFile
                }
            }

            if(($RemoveParameters -ne $null) -and $RemoveParameters.Count -gt 0)
            {
                Log-Info "Removing paramters from template file"
                $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                foreach($param in $RemoveParameters)
                {
                    $json.parameters = $json.parameters | Select-Object * -ExcludeProperty $param
                }
                Log-Info $json
                ConvertTo-Json $json | Out-File $templateParameterFile
            }
            $paramFileContent = [IO.File]::ReadAllText($templateParameterFile)
            $templateFileContent = [IO.File]::ReadAllText($templateFile)


            Log-Info "Parameter file content:"
            #Log-Info "$paramFileContent"
            $paramFileContent *>> $Global:wkLogFile
            Log-Info "Template file content:"
            $templateFileContent *>> $Global:wkLogFile
            #Log-Info "$templateFileContent"

            #Log-Info ("Parameter file content: {0}" -f ([IO.File]::ReadAllText($templateParameterFile)))
            #Log-Info ("Template file content: {0}" -f ([IO.File]::ReadAllText($templateFile)))
            #test the template and parameters file
            try
            {
                Test-AzureRmResourceGroupDeployment -ResourceGroupName $tenantRGName -TemplateParameterFile $templateParameterFile -TemplateFile $templateFile
            }
            catch
            {
                Write-Error "Template validation failed on $templateFile $templateParameterFile $_"
                throw $_
            }
            Log-Info "Starting resource group deployment $deploymentName"
            $curTimer = Start-WkTimer -TimerName "New Resource Group Deployment $templateName"
            New-AzurermResourceGroupDeployment -Name $deploymentName -ResourceGroupName $tenantRGName -TemplateFile $templateFile -TemplateParameterFile $templateParameterFile -Verbose *>> $Global:wkLogFile
            $Results.TotalDeploymentTimeInSec = [int]((Get-Date) - $curTimer).TotalSeconds
            $allTimers += End-WkTimer -TimerName "New Resource Group Deployment $templateName" -Timer $curTimer
            Log-Info "Resource group deployment finished on $deploymentName"

            # Check results of deployment, throw if there is a failure.
            # New-AzurermResourceGroupDeployment does not throw on all errors in deployment
            Log-Info "Deployment table for deployment: $deploymentName"
            $deployRes = Get-AzureRmResourceGroupDeploymentOperation -DeploymentName $deploymentName -ResourceGroupName $tenantRGName -Verbose

            $null = Log-DeploymentTableAndErrors -DeploymentResource $deployRes

            $tableLogged = $true
            foreach($res in $deployRes)
            {
                if($res.Properties.TargetResource.ResourceType -eq "Microsoft.Compute/virtualMachines")
                {
                    $Results.VmDeploymentTimesRaw.$($res.Properties.TargetResource.ResourceName) = $res.Properties.Duration
                }

                if($res.Properties.StatusCode -ne "OK" -and $res.Properties.StatusCode -ne "Created")
                {
                    $errMsg = "Deployment failed See deployment table for detailed information"
                    Log-Error  $errMsg
                    throw $errMsg
                }
            }
            $curTemplate++
        }
    }
    finally
    {
        if($tableLogged -eq $false)
        {
            try
            {
                $deployRes = Get-AzureRmResourceGroupDeploymentOperation -DeploymentName $deploymentName -ResourceGroupName $tenantRGName -Verbose

                $null = Log-DeploymentTableAndErrors -DeploymentResource $deployRes
            }
            catch
            {
                Log-Error "Failed to get deployment table. Deployment might not have started"
                Log-Error "$_"
            }
        }
        if($VmCreated -eq $true)
        {
            try
            {
                $vms =  Get-AzureRmVM -ResourceGroupName $tenantRGName
                foreach($vmname in $vms.Name)
                {
                    $status = Get-AzureRmVM -ResourceGroupName $tenantRGName -Status -Name $vmname
                    Log-Info $status.Name
                    Log-Info $status.ExtensionsText
                    Log-Info $status.StatusesText
                    Log-Info $status.BootDiagnosticsText
                    Log-Info $status.DisksText
                    Log-Info $status.VMAgentText
                }
             }
             catch
             {
                Log-Error "Failed to get VMs. No VMs may have been created"
                Log-Error "$_"
             }
        }
    }
}


function Set-WkAzureStackEnvironment
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $AzureStackMachineName,

        [Parameter(Mandatory=$true)]
        [String] $ArmEndpoint,

        [Parameter(Mandatory=$true)]
        [String] $GalleryEndpoint,

        [Parameter(Mandatory=$false)]
        [String] $AadGraphUri,

        [Parameter(Mandatory=$true)]
        [String] $AadTenantId,

        [Parameter(Mandatory=$true)]
        [String] $AadApplicationId,

        [Parameter(Mandatory=$true)]
        [String] $AdDomain,

        [Parameter(Mandatory=$true)]
        [PSCredential] $Credential,

        [Parameter(Mandatory=$true)]
        [String] $Location

    )


    $envName = "AzureStack Admin"
    $ResourceManagerEndpoint = $ArmEndpoint
    $endptres = Invoke-RestMethod "${ResourceManagerEndpoint}/metadata/endpoints?api-version=1.0"

    $ActiveDirectoryServiceEndpointResourceId = $($endptres.authentication.audiences[0])
    $deploymentGuid = $($endptres.authentication.audiences[0]).Split("/")[-2]
    $ActiveDirectoryEndpoint = $($endptres.authentication.loginEndpoint)
    $ActiveDirectoryEndpoint = $ActiveDirectoryEndpoint.TrimEnd("/") + "/"
    $GalleryEndpoint = $endptres.galleryEndpoint
    $GraphEndpoint = $endptres.graphEndpoint
    $StorageEndpointSuffix="$AdDomain".ToLowerInvariant()
    $AzureKeyVaultDnsSuffix="vault.$($AdDomain)".ToLowerInvariant()
    $AzureKeyVaultServiceEndpointResourceId= $("https://vault.$AdDomain".ToLowerInvariant() + "/" + $deploymentGuid)

    $token = Get-AzureStackToken -Authority $($endptres.authentication.loginEndpoint)  -AadTenantId $AadTenantId -Resource $AadApplicationId -Credential $Credential -Verbose
    $adminSubscription = Invoke-RestMethod -Method GET -URI ($ArmEndpoint + "subscriptions?api-version=2016-02-01") -Headers @{Authorization=("Bearer {0}" -f $token)}
    $adminSubscriptionId = $adminSubscription.Value[0].SubscriptionID

    Log-Info "Creating env config"
    $Global:AzureStackConfig = [PSCustomObject]@{
                    AzureStackMachineName = $AzureStackMachineName
                    ApiVersion = "2015-11-01"
                    GalleryApiVersion = "2015-04-01"
                    ArmLocation = $Location
                    Token = $token
                    SubscriptionId = $adminSubscriptionId
                    AdminUri = $ArmEndpoint
                    IsAad = $true
                    AadTenantId = $AadTenantId
                    AadApplicationId = $AadApplicationId
                    AadLoginUri = $($endptres.authentication.loginEndpoint)
                    SqlRpApiVersion="2014-04-01-preview"
                 }
    Log-Info "Creating admin environment"
    Add-AzureRmEnvironment -Name ($envName) `
        -ActiveDirectoryEndpoint ($ActiveDirectoryEndpoint) `
        -ActiveDirectoryServiceEndpointResourceId ($ActiveDirectoryServiceEndpointResourceId) `
        -ResourceManagerEndpoint ($ResourceManagerEndpoint) `
        -GalleryEndpoint ($GalleryEndpoint) `
        -GraphEndpoint ($GraphEndpoint) `
        -StorageEndpointSuffix ($StorageEndpointSuffix) `
        -AzureKeyVaultDnsSuffix ($AzureKeyVaultDnsSuffix) `
        -AzureKeyVaultServiceEndpointResourceId ($AzureKeyVaultServiceEndpointResourceId) `
        -EnableAdfsAuthentication:$ActiveDirectoryEndpoint.TrimEnd("/").EndsWith("/adfs", [System.StringComparison]::OrdinalIgnoreCase) | Out-Null

    Log-Info "Admin environment created"
    Log-Info "Authenticating to new environment"
    Add-AzureRmAccount -Environment (Get-AzureRmEnvironment -Name ($envName)) -Credential $Credential -TenantId $AadTenantId | Out-Null
    Log-Info "Getting sub to Default Provider Subscription"
    Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription" | Select-AzureRmSubscription | Out-Null

    Log-Info "Done create admin environment"
}

function Set-WkAzureStackTenantEnvironment
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $AzureStackMachineName,

        [Parameter(Mandatory=$true)]
        [String] $ArmEndpoint,

        [Parameter(Mandatory=$true)]
        [String] $GalleryEndpoint,

        [Parameter(Mandatory=$false)]
        [String] $AadGraphUri,

        [Parameter(Mandatory=$true)]
        [String] $AadTenantId,

        [Parameter(Mandatory=$true)]
        [String] $AadApplicationId,

        [Parameter(Mandatory=$true)]
        [String] $AdDomain,

        [Parameter(Mandatory=$true)]
        [PSCredential] $Credential,

        [Parameter(Mandatory=$true)]
        [String] $Location

    )

    Log-Info "Creating new tenant environment: endpoint: $ArmEndpoint"

    $envName = "AzureStack Tenant"
    $ResourceManagerEndpoint = $ArmEndpoint
    $endptres = Invoke-RestMethod "${ResourceManagerEndpoint}/metadata/endpoints?api-version=1.0"

    $ActiveDirectoryServiceEndpointResourceId = $($endptres.authentication.audiences[0])
    $deploymentGuid = $($endptres.authentication.audiences[0]).Split("/")[-2]
    $ActiveDirectoryEndpoint = $($endptres.authentication.loginEndpoint)
    $ActiveDirectoryEndpoint = $ActiveDirectoryEndpoint.TrimEnd("/") + "/"
    $GalleryEndpoint = $endptres.galleryEndpoint
    $GraphEndpoint = $endptres.graphEndpoint
    $StorageEndpointSuffix="$AdDomain".ToLowerInvariant()
    $AzureKeyVaultDnsSuffix="vault.$($AdDomain)".ToLowerInvariant()
    $AzureKeyVaultServiceEndpointResourceId= $("https://vault.$AdDomain".ToLowerInvariant() + "/" + $deploymentGuid)
    Log-Info "Creating tenant environment $ResourceManagerEndpoint"

    Add-AzureRmEnvironment -Name ($envName) `
        -ActiveDirectoryEndpoint ($ActiveDirectoryEndpoint) `
        -ActiveDirectoryServiceEndpointResourceId ($ActiveDirectoryServiceEndpointResourceId) `
        -ResourceManagerEndpoint ($ResourceManagerEndpoint) `
        -GalleryEndpoint ($GalleryEndpoint) `
        -GraphEndpoint ($GraphEndpoint) `
        -StorageEndpointSuffix ($StorageEndpointSuffix) `
        -AzureKeyVaultDnsSuffix ($AzureKeyVaultDnsSuffix) `
        -AzureKeyVaultServiceEndpointResourceId ($AzureKeyVaultServiceEndpointResourceId) `
        -EnableAdfsAuthentication:$ActiveDirectoryEndpoint.TrimEnd("/").EndsWith("/adfs", [System.StringComparison]::OrdinalIgnoreCase) | Out-Null
    Log-Info "Tenant environment created"
    }


function Remove-ParallelDeployments
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $SubscriptionUser,

        [Parameter(Mandatory=$true)]
        [String] $UserPassword,

        [Parameter(Mandatory=$true)]
        $DeploymentResults
    )

    try
    {

        foreach($res in $DeploymentResults)
        {

            if($res.TenantRg)
            {
                $newSub = $res.tenantSub
                Auth-Tenant -TenantName $SubscriptionUser -TenantPassword $UserPassword -SubId $res.tenantSub.SubscriptionId
                try
                {
                    $rg = Get-AzureRmResourceGroup -Name $res.TenantRg -Location $Global:AzureStackConfig.ArmLocation
                }
                catch
                {
                    Log-Info "Could not find resource group. It may have already been removed $_".
                    $rg = $null
                }
                if($rg -ne $null)
                {
                    Log-Info "Removing resource group $($res.tenantRg)"
                    Remove-AzureRmResourceGroup -Name $res.tenantRg -Force *>> $Global:wkLogFile
                }
            }
            else
            {
                Log-Info "No resource group specified."
            }
        }
    }
    catch
    {
        Log-Error "Failed to remove deployment resource. $_"
        throw $_
    }

}

function Remove-AdminRg
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $AdminResourceGroup,

        [Parameter(Mandatory=$true)]
        $DeploymentResults

    )
    foreach($res in $DeploymentResults)
    {
        Remove-WkSubscription -TargetSubscriptionId $res.tenantSub.SubscriptionId
    }

    #Remove-AzureRmResourceGroup -Name $AdminResourceGroup -Force *>> $Global:wkLogFile
}

# temporary. KPI jsons should be generated by the report generator
function New-KpiJson
{
    param
    (
        [Parameter(Mandatory=$true)]
        [string] $FileName,
        [Parameter(Mandatory=$true)]
        $Result,
        [Parameter(Mandatory=$true)]
        $LowerTarget,
        [Parameter(Mandatory=$true)]
        $Target,
        [Parameter(Mandatory=$true)]
        $UpperTarget
    )
    try
    {
        $filePath =   ".\" + $FileName
        $kpi = @{}
        $kpi.Result = $Result
        $kpi.LowerTarget = $LowerTarget
        $kpi.Target = $Target
        $kpi.UpperTarget = $UpperTarget

        $kpi | ConvertTo-Json | Out-File $filePath
    }
    catch
    {
        Log-Error "Failed to create JSON $_"
        #Ignoring failures for testing
        #throw $_
    }

}

function NewAzureStackToken
{
    [CmdletBinding()]
    param(

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$AADTenantID,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$EnvironmentDomainFQDN,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.Management.Automation.PSCredential]$Credentials,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$ArmEndpoint
    )

    $endpoints = GetAzureStackEndpoints -EnvironmentDomainFQDN $EnvironmentDomainFQDN -ArmEndPoint $ArmEndpoint

    $clientId = "1950a258-227b-4e31-a9cf-717495945fc2"

    $contextAuthorityEndpoint = ([System.IO.Path]::Combine($endpoints.ActiveDirectoryEndpoint, $AADTenantID)).Replace('\','/')
    $authContext = New-Object Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext($contextAuthorityEndpoint, $false)
    $userCredential = New-Object Microsoft.IdentityModel.Clients.ActiveDirectory.UserCredential($Credentials.UserName, $Credentials.Password)

    return ($authContext.AcquireToken($endpoints.ActiveDirectoryServiceEndpointResourceId, $clientId, $userCredential)).AccessToken
}

function GetAzureStackEndpoints
{
    [CmdletBinding()]

    param(
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$EnvironmentDomainFQDN,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$ArmEndpoint
    )

    $aadTenantId    = $AADTenantId
    $endptres = Invoke-RestMethod "${armEndpoint}/metadata/endpoints?api-version=1.0" -ErrorAction Stop

    $deploymentGuid = $($endptres.authentication.audiences[0]).Split('/', [StringSplitOptions]::RemoveEmptyentries)[2]
    $ActiveDirectoryEndpoint = $($endptres.authentication.loginEndpoint).TrimEnd("/") + "/"
    $ActiveDirectoryServiceEndpointResourceId = $($endptres.authentication.audiences[0])
    $ResourceManagerEndpoint = $armEndpoint
    $GalleryEndpoint = $endptres.galleryEndpoint
    $GraphEndpoint = $endptres.graphEndpoint
    $AzureKeyVaultServiceEndpointResourceId= $("https://vault.$EnvironmentDomainFQDN".ToLowerInvariant() + "/" + $deploymentGuid)
    $StorageEndpointSuffix = $EnvironmentDomainFQDN

    $asEndpointsObj = New-Object -TypeName PSObject
    $asEndpointsObj | Add-Member -Type NoteProperty  -TypeName System.Management.Automation.PSCustomObject -Name ActiveDirectoryEndpoint -Value $ActiveDirectoryEndpoint
    $asEndpointsObj | Add-Member -Type NoteProperty  -TypeName System.Management.Automation.PSCustomObject -Name ActiveDirectoryServiceEndpointResourceId -Value $ActiveDirectoryServiceEndpointResourceId
    $asEndpointsObj | Add-Member -Type NoteProperty  -TypeName System.Management.Automation.PSCustomObject -Name ResourceManagerEndpoint -Value $ResourceManagerEndpoint
    $asEndpointsObj | Add-Member -Type NoteProperty  -TypeName System.Management.Automation.PSCustomObject -Name GalleryEndpoint -Value $GalleryEndpoint
    $asEndpointsObj | Add-Member -Type NoteProperty  -TypeName System.Management.Automation.PSCustomObject -Name GraphEndpoint -Value $GraphEndpoint
    $asEndpointsObj | Add-Member -Type NoteProperty  -TypeName System.Management.Automation.PSCustomObject -Name StorageEndpointSuffix -Value $StorageEndpointSuffix
    $asEndpointsObj | Add-Member -Type NoteProperty  -TypeName System.Management.Automation.PSCustomObject -Name AzureKeyVaultServiceEndpointResourceId -Value $AzureKeyVaultServiceEndpointResourceId

    return $asEndpointsObj
}

function Parse-Duration
{
    param
    (
        [Parameter(Mandatory=$true)]
        [String] $Duration
    )

    try
    {
        $days = 0
        $hours = 0
        $minutes = 0
        $seconds = 0
        $str = $Duration.TrimStart("PT")
        if($Duration.Contains("D"))
        {
            $d = $str.Split("D")
            $days = [convert]::ToInt32($d[0], 10)
            $str = $d[1]
        }
        if($Duration.Contains("H"))
        {
            $h = $str.Split("H")
            $hours = [convert]::ToInt32($h[0], 10)
            $str = $h[1]
        }
        if($Duration.Contains("M"))
        {
            $m = $str.Split("M")
            $minutes = [convert]::ToInt32($m[0], 10)
            $str = $m[1]
        }
        if($Duration.Contains("S"))
        {
            $s = $str.Split("S")
            $dSeconds = [convert]::ToDouble($s[0])
            $seconds = [int]$dSeconds
        }

        $total = ($days * 24 * 60 * 60) + ($hours * 60 *60) + ($minutes * 60) + $seconds
    }
    catch
    {
        # Log error and continue
        Log-Error "Failed to parse duration. Duration String: '$Duration'"
        Log-Error $_
        
        $total = 0
    }
    
    return $total
}

function Format-VmDeploymentTimes {
    param
    (
        [Parameter(Mandatory = $true)]
        $Results
    )
    $Results.VmDeploymentTimes = @{}
    foreach ($k in $Results.VmDeploymentTimesRaw.GetEnumerator()) {
        $s = Parse-Duration -Duration $k.Value
        $Results.VmDeploymentTimes.$($k.Name) = $s
    }
}

function Remove-WkDeployment {
    param
    (

        [Parameter(Mandatory = $true)]
        [String] $SubscriptionUser,

        [Parameter(Mandatory = $true)]
        [String] $UserPassword,

        [Parameter(Mandatory = $true)]
        [String] $TenantSubscriptionName,

        [Parameter(Mandatory = $true)]
        [String] $TenantResourceGroup,

        [Parameter(Mandatory = $true)]
        [String] $AdminResourceGroup,

        [Parameter(Mandatory = $false)]
        [Bool] $ThrowOnFail = $false

    )
    Auth-Tenant -TenantName $SubscriptionUser -TenantPassword $UserPassword -SubName $TenantSubscriptionName
    $sub = Get-AzureRmSubscription -SubscriptionName $TenantSubscriptionName
    Log-Info "Removing resource group $tenantRGName"
    $resources = Get-AzureRmResource
    $retries = [math]::Round($resources.Count / 40)
    if($retries -le 0) {
        $retries = 1
    }
    $retryDelay = 10
    $success = $false
    Log-Info "Max attempts for resource group deletion: $retries "
    while($retries -ge 1 -and $success -eq $false) {
        try {
            Remove-AzureRmResourceGroup -Name $TenantResourceGroup -Force *>> $Global:wkLogFile
            Log-Info "Resource group $tenantRGName removed"
            $success = $true
        } catch {
            Log-Info "Failed to delete resource group $TenantResourceGroup $_"
            if($ThrowOnFail -eq $true) {
                throw $_
            } else {
                $retries--
                Start-Sleep -Seconds $retryDelay
            }
        }
    }

    Auth-Admin -AdminName $Global:DefaultAdminUser -AdminPassword $UserPassword

    if($success -eq $true) {
        $success = $false
        try {
            Log-Info "Removing tenant subscription $($sub.SubscriptionId)"
            Remove-WkSubscription -TargetSubscriptionId $sub.SubscriptionId
            Log-Info "Tenant subscription removed"
            $success = $true
        } catch {
            Log-Info "Failed to remove tenant subscription $($sub.SubscriptionId) $_"
            if($ThrowOnFail -eq $true) {
                throw $_
            }
        }

        if($success -eq $true) {
            try {
                Log-Info "Removing admin resource group $AdminResourceGroup"
                #HACK Comenting out removing admin resource group till we fix subscription deletion
                #Remove-AzureRmResourceGroup -Name $AdminResourceGroup -Force *>> $Global:wkLogFile
                Log-Info "Admin resource group removed"
            } catch {
                Log-Info "Failed to remove admin resource group $_"
                if($ThrowOnFail -eq $true) {
                    throw $_
                }
            }
        }
    }
}

function Delete-Image
{
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $Location,

        [Parameter(Mandatory = $true)]
        [string] $Publisher,

        [Parameter(Mandatory = $true)]
        [string] $Offer,

        [Parameter(Mandatory = $true)]
        [string] $Sku,

        [Parameter(Mandatory = $true)]
        [string] $Version

    )
    try
    {
        $pirImage = Get-AzureRmVmImage -location $Location `
            -Offer $Offer `
            -PublisherName $Publisher `
            -Skus $Sku `
            -Version $Version `
            -ErrorAction SilentlyContinue
        if($pirImage)
        {
            Write-Host "Found image ($Offer, $Publisher, $Sku, $Version) in PIR. Proceeding to delete ..." -Verbose
        }
        else
        {
            Write-Host "Didnot find image ($Offer, $Publisher, $Sku, $Version) in PIR to delete" -Verbose
            return;
        }
        $deleteParams = 
        @{
            ResourceType = "Microsoft.Compute.Admin/locations/artifactTypes/publishers/offers/skus/versions"
            ResourceName = "{0}/platformImage/{1}/{2}/{3}/{4}" -f $Location, $Publisher, $Offer, $Sku, $Version
            ApiVersion   = "2015-12-01-preview"
        }

        Write-Host "Deleting VM Image ($Offer, $Publisher, $Sku, $Version) from PIR." -Verbose
        Remove-AzureRmResource @deleteParams -Force

        # Checking if the image entry is removed from PIR. Sometime it takes longer to remove the entry.
        $currentRetryAttempt = 0
        $maxRetryAttempts = 10
        $waitSeconds = 60
        while ($currentRetryAttempt -lt $maxRetryAttempts) 
        {
            $pirImage = Get-AzureRmVmImage -location $location -Offer $offer -PublisherName $publisher -Skus $sku -Version $version -ErrorAction SilentlyContinue
            if(!$pirImage) {
                break;
            }
            Start-Sleep -s $waitSeconds
            $currentRetryAttempt++
            Write-Host "Still removing the VM Image entry ($Offer, $Publisher, $Sku, $Version). Retrying $currentRetryAttempt." -Verbose        
        }
    }
    catch
    {
        throw $_
    }    
    Write-Host "Delete VM Image ($Offer, $Publisher, $Sku, $Version) from PIR is done" -Verbose
}

function Upload-Image
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ImageType] $ImageType,

		[Parameter(Mandatory = $false)]
        [string] $ArmEndpoint,

        [Parameter(Mandatory = $false)]
        [string] $resourceGroupName,

        [Parameter(Mandatory = $false)]
        $MarketplaceDownload = $true,

        [Parameter(Mandatory = $false)]
        [bool] $UploadFresh = $false,
        
         [Parameter(Mandatory = $false)]
         [String] $azureStorageAccountName,
        
         [Parameter(Mandatory = $false)]
         [String] $azureStorageKey
    )

    try
    {
        $ImageMetadata = Get-ImageMatadata -ImageType $ImageType
    }
    catch
    {
        $message = "Could not find image for '$($ImageType.ToString())'" 
        Log-Error $message
        throw $message
    }

    Log-Info "Downloading Product image '$($ImageMetadata.MarketplaceProductName)'. ArmEndpoint: '$ArmEndpoint'"

    if($MarketplaceDownload -and [string]::IsNullOrEmpty($ArmEndpoint))
	{
		$message = "Missing ARM endpoint. Pass a valid ARM endpoint."
		Log-Error $message
		throw $message;
	}

    if($MarketplaceDownload -and [string]::IsNullOrEmpty($resourceGroupName))
	{
		$message = "Missing Resource group name. Pass a valid resource group name."
		Log-Error $message
		throw $message;
	}

    if($MarketplaceDownload -and [string]::IsNullOrEmpty($resourceGroupName) -and ([string]::IsNullOrEmpty($azureStorageAccountName) -or [string]::IsNullOrEmpty($azureStorageKey)))
    {
        $message = "Missing Marketplace feed azure storage account name or key. Pass a valid Marketplace feed azure storage account name and key."
        Log-Error $message
        throw $message;
    }

    # If desired Image is an OS image (not extension), check if it already exists in PIR.
    if($ImageMetadata.SKU -ne $null)
    {
        $pirImage = Get-AzureRmVmImage -location $Global:azureStackLocation `
                    -Offer $ImageMetadata.Offer `
                    -PublisherName $ImageMetadata.Publisher `
                    -Skus $ImageMetadata.SKU `
                    -Version $ImageMetadata.Version `
                    -ErrorAction SilentlyContinue

        if($pirImage)
        {
            Log-Info "Found image ($($ImageMetadata.Offer), $($ImageMetadata.Publisher), $($ImageMetadata.SKU), $($ImageMetadata.Version)) in PIR."

            if ($UploadFresh)
            {
                Log-Info "Image download is set to get fresh image so cleaning up one already present in PIR."
                try
                {
                    Delete-Image -Location $Global:azureStackLocation `
                        -Offer $ImageMetadata.Offer `
                        -Publisher $ImageMetadata.Publisher `
                        -Sku $ImageMetadata.SKU `
                        -Version $ImageMetadata.Version
                }
                catch
                {
                    Write-Error -Message "Deletion of VM Image failed with Error: $Error"
                    throw $_
                }
            }
            else
            {
                Log-Info "Image download is not set to get fresh image so not cleaning up one already present in PIR. Tests will use the one present"
                return;
            }
        }
    }

    # If syndication registration had failed, side load the OS images.
    if($MarketplaceDownload -eq $false)
    {
        Log-Info "download from marketplace: '$MarketplaceDownload'."
            
        if($ImageMetadata.SKU -ne $null)
        {
            try
            {
                Log-Info "Download OS image from test blob."
                Upload-VhdFromUrl -Offer $ImageMetadata.Offer `
                    -Publisher $ImageMetadata.Publisher `
                    -Sku $ImageMetadata.SKU `
                    -Version $ImageMetadata.Version `
                    -OsType $ImageMetadata.OSType `
                    -Url $ImageMetadata.ImageURI
            }
            catch
            {
                $message = "Failed to upload image in PIR: $_"
                Log-Error $message
                throw $message;
            }
        }
        else
        {
            # TODO: Handle the case when Registration failed and extension is also not in-build (like SqlIaas extension).
            # Side-loading extension is not possible.
            Log-Info "Use the extension from the build."
        }

        return
    }

    # We will syndicate the VHD from marketplace. This code assumes we have already done market place registration.
    try
    {
        if([string]::IsNullOrEmpty($ImageMetadata.MarketplaceProductName))
        {
            throw "No Product Name property exists to download from Marketplace."
        }

        Log-Info "Get '$($ImageMetadata.MarketplaceProductName)' from marketplace feed to define last product name"
        $productName = Get-ProductNameByDisplayNameFromMarketplaceFeed -productDisplayName $ImageMetadata.MarketplaceProductName -azureStorageAccountName $azureStorageAccountName -azureStorageKey $azureStorageKey
       
        if ($productName) {
            Log-Info "Download '$($productName)' from marketplace using ArmEndpoint: $ArmEndpoint."
            Download-AzureDiscoveredProduct -ArmEndpoint $ArmEndpoint -resourceGroupName $resourceGroupName -productName $productName
        } else {
               $errMessage = "Failed to get productName '$($ImageMetadata.MarketplaceProductName)' from Marketplace feed ."
               Log-Error "$errMessage"
               throw $errMessage
        }
    }
    catch
    {
        $errMessage = "Failed to download image '$($ImageMetadata.MarketplaceProductName)' from Marketplace."
        Log-Error "$errMessage : $_"

        if($ImageMetadata.SKU -ne $null)
        {
            try
            {
                Log-Info "Sideloading the image from test blob."

                if([string]::IsNullOrEmpty($ImageMetadata.ImageURI))
                {
                    throw "No sideload image exists."
                }
                Upload-VhdFromUrl -Offer $ImageMetadata.Offer `
                    -Publisher $ImageMetadata.Publisher `
                    -Sku $ImageMetadata.SKU `
                    -Version $ImageMetadata.Version `
                    -OsType $ImageMetadata.OSType `
                    -Url $ImageMetadata.ImageURI
            }
            catch
            {
                $message = "Failed to upload image in PIR: $_"
                Log-Error $message
                throw $message;
            }
        }
        else
        {
                # TODO: Handle the case when download failed and extension is also not in-build (like SqlIaas extension).
                # Side-loading extension is not possible.
                Log-Info "Use the extension from the build."
        }

        throw "$errMessage : $_"
    }
}

function Download-AzureDiscoveredProduct {
    Param(
        [Parameter(Mandatory=$true)]
        [String] $ArmEndpoint,

        [Parameter(Mandatory=$true)]
        [String] $productName,

        [Parameter(Mandatory=$true)]
        [String] $resourceGroupName

    )

    $subscription = Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription"

    # token for the rest API may have expired. Get a new token.
    Get-WkAdminAzureStackToken
    $headers = @{ Authorization = ("Bearer $($Global:AzureStackConfig.Token)") }

    $baseURI = $ArmEndpoint
    $uri = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/resourceGroups/' + $resourceGroupName + '/providers/Microsoft.AzureBridge.Admin/activations/default/products/' + $productName + '/download?api-version=2016-01-01'
    $uriGet = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/resourceGroups/' + $resourceGroupName + '/providers/Microsoft.AzureBridge.Admin/activations/default/downloadedProducts/' + $productName + '?api-version=2016-01-01'

    Log-Info "$uri"

    try {
        $response = Invoke-RestMethod -Method POST -Uri $uri -ContentType 'application/json' -Headers $Headers
    }
    catch {
        Write-Verbose "Download product $productName failed. $_"
        throw $_
    }

    # token for the rest API may have expired. Get a new token.
    Get-WkAdminAzureStackToken | Out-Null
    $headers = @{ Authorization = ("Bearer $($Global:AzureStackConfig.Token)") }
    $product = Invoke-RestMethod -Method GET -Uri $uriGet -ContentType 'application/json' -Headers $Headers

    while($product.Properties.ProvisioningState -ne 'Succeeded') {
        if($product.Properties.ProvisioningState -eq 'Failed') {
            $errMsg = "Product download failed. :("
            Log-Error $errMsg
            throw $errMsg
        }

        if($product.Properties.ProvisioningState -eq 'Canceled') {
            Log-Info "Product download was canceled.";
            break;
        }

        Write-Host "Downloading";
        Start-Sleep -s 30
        # token for the rest API may have expired. Get a new token.
        Get-WkAdminAzureStackToken | Out-Null
        $headers = @{ Authorization = ("Bearer $($Global:AzureStackConfig.Token)") }
        $product = Invoke-RestMethod -Method GET -Uri $uriGet -ContentType 'application/json' -Headers $Headers
    }

    $product
}

function Upload-VhdFromUrl {
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $Url,

        [Parameter(Mandatory = $true)]
        [String] $Publisher,

        [Parameter(Mandatory = $true)]
        [String] $Offer,

        [Parameter(Mandatory = $true)]
        [String] $Sku,

        [Parameter(Mandatory = $true)]
        [String] $Version,

        [Parameter(Mandatory = $true)]
        [String] $OsType
    )

    $debugName = "$publisher : $offer : $sku : $version"

    $pir = Get-AzureRmVmImage -location $Global:azureStackLocation `
            -Offer $Offer `
            -PublisherName $Publisher `
            -Skus $Sku `
            -Version $Version `
            -ErrorAction SilentlyContinue

    if ($pir) {
        Log-Info "Found specified image in gallery:  $debugName"
        return
    }

    $retryAttemps = 0
    $pirWaitRetry = 5
    $pirWaitDelaySec = 70
    $imageFound = $false
    while ($retryAttemps -lt $pirWaitRetry) {
        $imageFound = $false
        try {
            PlacePlatformImageIntoPIR -publisher $Publisher `
                -offer $Offer `
                -sku $Sku `
                -version $Version `
                -osType $OsType `
                -osDiskURI $Url `
                -Verbose `
                -azureStackDomain $Global:externalDomain `
                -Location $Global:AzureStackConfig.ArmLocation
            $imageFound = $true
        }
        catch {
            Log-Warning "Failed to find the image in the PIR Retrying."
        }

        if (!$imageFound) {
            Start-Sleep -s $pirWaitDelaySec
            $retryAttemps++
        }
        else {
            break;
        }

        if ($imageFound -eq $false) {
            Log-Error "Failed to find the image in the PIR after uploading the image."
        }
    }
}

# Until there is inbox script support, adding the upload function directly to the test
# Assumed already authed as tenant admin, use global auth token for rest APIs
Function PlacePlatformImageIntoPIR {

    Param(
        [ValidateNotNullorEmpty()]
        [String] $publisher,

        [ValidateNotNullorEmpty()]
        [String] $offer,

        [ValidateNotNullorEmpty()]
        [String] $sku,

        [ValidateNotNullorEmpty()]
        [String] $version,

        [ValidateNotNullorEmpty()]
        [String] $osDiskLocalPath,

        [ValidateNotNullorEmpty()]
        [String] $osDiskURI,

        [ValidateSet('Windows' , 'Linux')]
        [String] $osType,

        [String] $location,

        [string[]] $dataDisksLocalPaths,

        [string[]] $dataDiskURIs,

        [string] $billingPartNumber,

        [string] $azureStackDomain
    )


    $subscription = Get-AzureRmSubscription -SubscriptionName "Default Provider Subscription"


    $baseURI = $Global:AdminArmEndpoint
    $uri = $baseUri + '/subscriptions/' + $subscription.SubscriptionId + '/providers/Microsoft.Compute.Admin/locations/' + $location + '/artifactTypes/platformImage/publishers/' + $publisher
    $uri = $uri + '/offers/' + $offer + '/skus/' + $sku + '/versions/' + $version + '?api-version=2015-12-01-preview'

    #building platform image JSON

    #building osDisk json

    $osDiskJSON = '"OsDisk":{"OsType":"' + $osType + '","Uri":"' + $osDiskURI + '"}'

    #building details JSON
    $detailsJSON = ''
    if ($PSBoundParameters.ContainsKey('billingPartNumber')) {
        $detailsJSON = '"Details":{"BillingPartNumber":"' + $billingPartNumber + '"}'
    }

    #building dataDisk JSON
    $dataDisksJSON = ''

    if ($dataDiskURIs.Count -ne 0) {
         $dataDisksJSON = '"DataDisks":['
         $i = 0
         foreach($dataDiskURI in $dataDiskURIs) {
            if($i -ne 0) {
                $dataDisksJSON = $dataDisksJSON +', '
            }

            $newDataDisk = '{"Lun":' + $i + ', "Uri":"' + $dataDiskURI + '"}'
            $dataDisksJSON = $dataDisksJSON + $newDataDisk;

            ++$i
        }

        $dataDisksJSON = $dataDisksJSON + ']'
    }

    #building ARMResource

    $propertyBody = $osDiskJSON

    if (![string]::IsNullOrEmpty($dataDisksJson)) {
        $propertyBody = $propertyBody + ', ' + $dataDisksJson
    }

    if (![string]::IsNullOrEmpty($detailsJson)) {
        $propertyBody = $propertyBody + ', ' + $detailsJson
    }

    # token for the rest API may have expired. Get a new token.
    Get-WkAdminAzureStackToken
    $headers = @{ Authorization = ("Bearer $($Global:AzureStackConfig.Token)") }

    $RequestBody = '{"Properties":{' + $propertyBody + '}}'
    Log-Info "$uri"
    Log-Info "$RequestBody"
    $res = Invoke-RestMethod -Method PUT -Uri $uri -Body $RequestBody -ContentType 'application/json' -Headers $Headers

    $platformImage = Invoke-RestMethod -Method GET -Uri $uri -ContentType 'application/json' -Headers $Headers

    while ($platformImage.Properties.ProvisioningState -ne 'Succeeded') {
        if ($platformImage.Properties.ProvisioningState -eq 'Failed') {
            Log-Error "Platform image download failed. :("
            throw "Platform image download failed. :("
        }

        if ($platformImage.Properties.ProvisioningState -eq 'Canceled') {
            Log-Info "Platform image download was canceled."
            throw "Platform image download was canceled."
        }

        Write-Host "Downloading";
        Start-Sleep -s 4
        $platformImage = Invoke-RestMethod -Method GET -Uri $uri -ContentType 'application/json' -Headers $Headers
    }

}

function Upload-OsVhd {
    param(
        [Parameter(Mandatory = $true)]
        [String] $StorageAccountName,

        [Parameter(Mandatory = $true)]
        [String[]] $ImagePaths,

        [Parameter(Mandatory = $true)]
        [String[]] $BlobNames,

        [Parameter(Mandatory = $true)]
        [String] $RgName,

        [Parameter(Mandatory = $true)]
        [String] $ContainerName


    )
    $storageEndPoint = $Global:externalDomain
    $key = Get-AzureRmStorageAccountKey -ResourceGroupName $RgName -AccountName $StorageAccountName

    $storageContext = New-AzureStorageContext $StorageAccountName -StorageAccountKey $key.Key1 -EndPoint $storageEndPoint

    New-AzureStorageContainer -Name $ContainerName -Permission Container -Context $storageContext

    # Upload os vhd
    $curBlob = 0;
    foreach ($image in $ImagePaths) {
        $imageFileName = Split-Path $image -Leaf

        Set-AzureStorageBlobContent -Container $ContainerName -File $image -Context $storageContext -Blob $BlobNames[$curBlob] -BlobType Page
        $curBlob++
    }

}

function Download-InfraFileFromAzure {
    param
    (
        [Parameter(Mandatory = $false)]
        [string] $Key,

        [Parameter(Mandatory = $false)]
        [string] $BlobName
    )

    $success = $false
    $retries = 20
    while ($success -eq $false -and $retries -ge 0) {
        $success = $true
        Log-Info "Downloading $blobName, retries left $retries"
        try {
            $localDir = $env:Temp
            $fullPath = $localDir + "\" + $BlobName
            if (Test-Path -Path $fullPath) {
                Log-Info "Blob $BlobName is already present at $fullPath. Skipping download"
                return $fullPath
            }
            $containerName = "mascicontainer"
            $storageContext = New-AzureStorageContext -StorageAccountName "masworkloadci" -StorageAccountKey $Key -Environment "AzureCloud"
            Get-AzureStorageBlobContent -Blob $BlobName -Container $containerName -Destination $localDir -Context $storageContext | Out-Null

        }
        catch {
            $success = $false
            Log-Info "Failed to download $blobName from Azure. $retries left. $_"
            Start-Sleep -Seconds 10
        }
        $retries--
        if ($success = $false) {
            Start-Sleep -Seconds 10
        }

    }
    if ($success -eq $false) {
        $errMsg = "Failed to download $blobName from Azure after retries"
        Write-Error $errMsg
        throw $errMsg
    }
    return $fullPath
}

function Get-WkAdminAzureStackToken {
    $password = ConvertTo-SecureString $Global:aadAdminPassword -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($Global:aadAdminUser, $password)

    $token = Get-AzureStackToken -Authority $Global:AzureStackConfig.AadLoginUri -AadTenantId $Global:AzureStackConfig.AadTenantId -Resource $Global:AzureStackConfig.AadApplicationId -Credential $credential -Verbose

    $Global:AzureStackConfig.Token = $token
}

function Assert-ProductDeletion {
    param
    (
        [Parameter(Mandatory=$true)]
        [ScriptBlock] $ScriptBlock
    )
    Log-Info "Assert-ProductDeletion: scriptblock $ScriptBlock"

    Assert-ThrowsContains {Retry-Function -script $ScriptBlock -maxTries 12 -intervalInSeconds 20 } -compare "Not Found"
}

function Get-AzureStackDeploymentId {
    param(
        [Parameter(Mandatory=$true, HelpMessage="Azure stack Tenant Arm endpoint")]
        [string]$TenantArmEndpoint
    )
    $deploymentId = ""

    try {
        $TenantArmEndpoint = $TenantArmEndpoint.Trim("\","/")
        $endpoint = Invoke-RestMethod "$TenantArmEndpoint/metadata/endpoints?api-version=1.0"
        $deploymentId = $endpoint.authentication.audiences[0].Split("/")[-1]
    }
    catch {
        Write-Error -Message "Please verify the Tenant Arm Endpoint: $TenantArmEndpoint is correct "
    }
    return $deploymentId
}

function ReadAppSetting {
    param
    (
        [Parameter(Mandatory = $true)]
        [xml] $ConfigXml,

        [Parameter(Mandatory = $true)]
        [String] $Key
    )

    return ($ConfigXml.configuration.appSettings.add | where key -eq $Key ).value
}


function Assert-NotNull {
    param
    (
        [Parameter(Mandatory = $true)]
        [object] $actual,

        [Parameter(Mandatory = $false)]
        [string] $message
    )

    if (!$message) {
        $message = "Assertion failed because the object is null: " + $actual
    }

    if ($actual -eq $null) {
        throw $message
    }

    return $true
}

function Assert-True {
    param
    (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $script,

        [Parameter(Mandatory = $false)]
        [string] $message
    )

    if (!$message) {
        $message = "Assertion failed: " + $script
    }

    $result = &$script
    if (-not $result) {
        Write-Error "Failure: $message"
        throw $message
    }

    return $true
}


function Retry-Function {
    param
    (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock,

        [Parameter(Mandatory = $false)]
        [Object] $Argument,

        [Parameter(Mandatory = $true)]
        [int] $MaxTries,

        [Parameter(Mandatory = $false)]
        [int] $IntervalInSeconds
    )

    if ($IntervalInSeconds -eq 0) { $IntervalInSeconds = 60  }
    Log-Info "Retry-Function: Retrying max $MaxTries interval $IntervalInSeconds $ScriptBlock"
    $result = Invoke-Command -ScriptBlock $ScriptBlock -ArgumentList $Argument;

    Log-Info "Retry-Function: First call made $result"
    $tries = 1;
    while (( $result -ne $true) -and ($tries -le $MaxTries)) {
        Log-Info "Retry-Function: On try $tries"
        Start-Sleep -Seconds $IntervalInSeconds

        $result = Invoke-Command -ScriptBlock $ScriptBlock -ArgumentList $Argument;
        $tries++;
    }

    return $result;
}


function Assert-SubscriptionDeletion {
    param
    (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $ScriptBlock
    )
    Log-Info "Assert-SubscriptionDeletion: scriptblock $ScriptBlock"

    Assert-ThrowsContains {Retry-Function -script $ScriptBlock -maxTries 12 -intervalInSeconds 20 } -compare "SubscriptionNotFound"
}


function Assert-ThrowsContains {
    param
    (
        [Parameter(Mandatory = $true)]
        [ScriptBlock] $script,

        [Parameter(Mandatory = $true)]
        [string] $compare
    )

    Log-Info "Assert-ThrowsContains: scriptblock $script"
    try {
        &$script
    }
    catch {
        if ($message -ne "") {
            $actualMessage = $_.Exception.Message
            if ($actualMessage.Contains($compare)) {
                return $true;
            }
            else {
                Log-Info ("Caught exception: '$actualMessage'")
                throw "Expected exception does not contain expected text '$compare', the actual message is '$actualMessage'";
            }
        }
        else {
            return $true;
        }
    }

    throw "No exception occured";
}

# Being used by performance tests.
function Deploy-Windows2016ImageFromIso {
    param
    (
        [Parameter(Mandatory = $false)]
        [string] $IsoPath = "https://aka.ms/ng9w87"
    )

    $pir = Get-AzureRmVmImage -location $Global:azureStackLocation -Offer "WindowsServer" -PublisherName "MicrosoftWindowsServer" -Skus "2016-Datacenter" -Version "1.0.0" -ErrorAction SilentlyContinue

    if ($pir) {
        Log-Info "Found specified image in gallery"
        return
    }

    #depends on azurestack-tools to be present in ..\AzureStackTools
    #check if image is present
    Log-Info "Downloading Windows Server 2016 iso from $IsoPath"
    Import-Module -Name $PSScriptRoot\..\AzureStack-Tools\Connect\AzureStack.Connect.psm1 -Force
    Import-Module -Name $PSScriptRoot\..\AzureStack-Tools\Infrastructure\AzureStack.Infra.psm1 -Force
    Import-Module -Name $PSScriptRoot\..\AzureStack-Tools\ComputeAdmin\AzureStack.ComputeAdmin.psm1 -Force
    $isoFile = Download-File -FileUrl $IsoPAth
    $isoFinal = $isoFile + ".iso"
    ren $isoFile $isoFinal
    Log-Info "Adding Windows Server 2016 is AzureStack using is $isoFile"

    $password = ConvertTo-SecureString $Global:aadAdminPassword -AsPlainText -Force

    $credential = New-Object System.Management.Automation.PSCredential($Global:DefaultAdminUser, $password)

    try {
        New-Server2016VMImage -ISOPath $isoFinal -TenantId $Global:AadTenantId -AzureStackCredentials $credential -ArmEndpoint $Global:AdminArmEndpoint -Net35 -CreateGalleryItem $false | Out-Null
    }
    catch {
        Log-Error "Failed to add image $isoFinal to PIR via New-Server2016VMImage $_"
        throw $_
    }
    $pir = Get-AzureRmVmImage -location $Global:azureStackLocation -Offer "WindowsServer" -PublisherName "MicrosoftWindowsServer" -Skus "2016-Datacenter" -Version "1.0.0" -ErrorAction SilentlyContinue

    if ($pir) {
        Log-Info "Found specified image in gallery"
        return
    }

    Log-Info "Removing Windows Server 2016 iso $isoFinal"

    try {
        Remove-Item -Path $isoFinal
        Remove-Item $env:TMP\AzureStack-Tools\ComputeAdmin\Server2016DatacenterFullEval.vhd -Force | Out-Null
    }
    catch {
        # Non terminating error
        Log-Info "Failed to remove temporary PIR upload files $_"
    }
}

function New-TestPlanAndOffer {
    param
    (
        [Parameter(Mandatory = $true)]
        [String] $AdminUser,

        [Parameter(Mandatory = $true)]
        [String] $AdminPassword,

        [String[]] $Services = @("Microsoft.Compute", "Microsoft.Storage", "Microsoft.Network"),

        [String] $AdminRg,

        [String] $SpecifiedOfferName,

        [String] $SpecifiedPlanName,

        [String] $SpecifiedTenantSubscriptionName,

        [String] $ArmLocation

    )
    if (!$SpecifiedOfferName) {
        $offerName = "TestOffer-" + [Guid]::NewGuid().ToString()
    }
    else {
        $offerName = $SpecifiedOfferName
    }
    if (!$SpecifiedPlanName) {
        $planName = "TestPlan-" + [Guid]::NewGuid().ToString()
    }
    else {
        $planName = $SpecifiedPlanName
    }
    if (!$AdminRg) {
        $rgName = "TestRG-" + [Guid]::NewGuid().ToString()
    }
    else {
        $rgName = $AdminRg
    }

    Log-Info "Offer Name: $offerName"
    Log-Info "Plan Name: $planName"
    Log-Info "Offer and plan resource group name: $rgName"
    Log-Info "Tenant subscription display name: $subDisplayName"
    try {
        Log-Info "Creating resource group $rgName"
        $rgCreated = New-AzureRmResourceGroup -Name $rgName -Location $ArmLocation -Force *>> $Global:wkLogFile
        Log-Info "Done creating resource group $rgName"

        $quotaIds = Get-WkServiceQuotas -Services $Services
        Log-Info "Creating plan $planName"
        $plan = New-AzureRMPlan -Name $planName -DisplayName $planName -ArmLocation $ArmLocation -ResourceGroup $rgName -QuotaIds $quotaIds # *>> $Global:wkLogFile
        Log-Info "Done creating plan $planName"

        Assert-NotNull $plan
        Assert-True {$plan.Properties.DisplayName -eq $planName}

        Log-Info "Creating offer $offerName"
        $offer = New-AzureRMOffer -Name $offerName -DisplayName $offerName -State Private -BasePlanIds @($plan.Id) -ArmLocation $ArmLocation -ResourceGroup $rgName *>> $Global:wkLogFile
        Log-Info "Done creating offer $offerName"

        $offer = Get-AzureRMOffer -Name $OfferName -ResourceGroup $rgName -Managed

        Assert-NotNull $offer
        Assert-True { $offer.Properties.DisplayName -eq $offerName}
        $offer.properties.state = "Public"
        $offer | Set-AzureRMOffer -ResourceGroup $rgName *>> $Global:wkLogFile

    }
    catch {
        Log-Error "Failed to create plan and offer $_"
        throw $_
    }

    $planData = @{}
    $planData.plan = $plan
    $planData.offer = $offer
    $planData.adminRg = $rgName
    return $planData
}

function Stop-VmOnFailure{
    param(
        [Parameter(Mandatory = $true)]
        [String] $resourceGroup

    )
    $vms = Get-AzureRmVm -ResourceGroupName $resourceGroup
    Foreach ($vm in $vms){
      Stop-AzureRmVm -Name $vm.Name -ResourceGroup $resourceGroup -Force
    }
}

<#
.SUMMARY
Generates template from createuidefinition.json
#>
function Generate-DeploymentTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string] $createUiDefinitionUri,

        [Parameter(Mandatory = $true)]
        [String] $azureStorageAccountName,
       
        [Parameter(Mandatory = $true)]
        [String] $azureStorageKey,

        [Parameter(Mandatory = $true)]
        [String] $productName,

        [Parameter(Mandatory = $true)]
        [String] $tenantRGName
    )

    $scriptLocation = $PSScriptRoot
    $templateGeneratorTool = $scriptLocation + '\..\TemplateGenerator'
    if (!(Test-Path $templateGeneratorTool)) {
        $errMessage = "TemplateGenerator tool is not installed, deployment from generated template will be skipped."
        Log-Error $errMessage
        throw $errMessage
    }

    Set-Location -Path $templateGeneratorTool
    # Generate template if azpkg has custom template
    .\ux-tests-run.ps1 -uri $createUiDefinitionUri -productName $productName -resourceGroup $tenantRGName | Out-Null
    
    $jsonPath = ".\temp\$productName.json"
    if (Test-Path $jsonPath) {
        $uri = Upload-DeplymentTemplateToBlob -azureStorageAccountName $azureStorageAccountName -azureStorageKey $azureStorageKey -templateJsonPath  $jsonPath -productName $productName
    }
    
    Set-Location -Path $scriptLocation
    Log-Info "Generated template uri for $productName : $uri"

    return $uri
}

<#
.SUMMARY
Compiles uri for systemgallery blob createuidefinition.json
#>
function Get-AzureDiscoveredProductTemplateUri {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string] $galleryItemIdentity,

        [Parameter(Mandatory = $true)]
        [String] $azureStorageAccountName,

        [Parameter(Mandatory = $true)]
        [String] $azureStorageKey,

        [Parameter(Mandatory = $true)]
        [String] $productName,

        [Parameter(Mandatory = $true)]
        [String] $tenantRGName
    )

    # token for the rest API may have expired. Get a new token.
    Get-WkAdminAzureStackToken | Out-Null
    $headers = @{ Authorization = ("Bearer $($Global:AzureStackConfig.Token)") }
    
    $galleryItemUri = $Global:AzureStackConfig.AdminUri + '/subscriptions/' + $Global:AzureStackConfig.SubscriptionId + '/providers/microsoft.gallery.admin/galleryItems/' + $galleryItemIdentity + '?api-version=2015-04-01'
    $galleryItem = Invoke-RestMethod -Method GET -Uri $galleryItemUri -ContentType 'application/json' -Headers $Headers

    $createuidefinition = $galleryItem.properties.artifacts | where { $_.Name -eq "createuidefinition"}
    
    if ($createuidefinition) { 
        # Generate template from custom template definition
        $executionMachine = $env:COMPUTERNAME + "." + $adDomain
        $domainCredential = New-Object System.Management.Automation.PSCredential($adUser, (ConvertTo-SecureString -String $adPassword -AsPlainText -Force))
        $testDir = $PSScriptRoot

        try {
            $scriptBlock = {
            Import-Module $using:testDir\MASUtil.ps1 -Force -Verbose:$false | Out-Null
                Generate-DeploymentTemplate `
                    -createUiDefinitionUri $using:createuidefinition.uri `
                    -azureStorageAccountName $using:AzureStorageAccountName `
                    -azureStorageKey $using:AzureStorageKey `
                    -productName $using:productName `
                    -tenantRGName $using:tenantRGName -Verbose
            }

            $templateUri = Invoke-Command -ComputerName $executionMachine -ScriptBlock $scriptBlock -Credential $domainCredential -Authentication Credssp
        }
        catch {
            Log-Error "Template for product $productName can't be generated. $_"
        }

        Set-Location $testDir

    } else {
        # TODO complete the functionality WI 13558604
        # Get fully defined template from systemgallery blob
        # $tempalte = $galleryItem.properties.artifacts | where { $_.uri -like "*azuredeploy.json"}
        # if ($tempalte) {
        #    $templateUri = $tempalte.uri
        # }
    }

    return $templateUri
}

<#
.SUMMARY
Uploads <productname>.json for specific product to the public blob
#>
function Upload-DeplymentTemplateToBlob {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [String] $azureStorageAccountName,

        [Parameter(Mandatory = $true)]
        [String] $azureStorageKey,

        [Parameter(Mandatory = $true)]
        [String] $templateJsonPath,

        [Parameter(Mandatory = $true)]
        [String] $productName
    )
    
    $containerName = "mascitemplates"
    $storageContext = New-AzureStorageContext -StorageAccountName $azureStorageAccountName -StorageAccountKey $azureStorageKey -Environment "AzureCloud"

    try {
        # Upload <productName>.json
        Log-Info "Template for product $productName is uploading to $containerName from $templateJsonPath location"

        $blobName = $productName + '.json'
        Set-AzureStorageBlobContent -Container $containerName -File $templateJsonPath -Context $storageContext -Blob $blobName -BlobType Block -Force | Out-Null
        return (Get-AzureStorageBlob -blob $blobName -Container $containerName -Context $storageContext).ICloudBlob.uri.AbsoluteUri

    } catch {
        Log-Error "Generated template for product $productName is not uploaded to $containerName blob. $_"
    }
}

<#
.SUMMARY
Generates a basic auth header for REST calls into VSTS API
#>
function Get-BasicAuthHeader {
    [CmdletBinding()]
    param (
     [Parameter(Mandatory=$true)]
     [PSCredential]$Credential
    )
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $Credential.UserName,$Credential.GetNetworkCredential().Password)))
    @{Authorization = ("Basic {0}" -f $base64AuthInfo)}
} 
    
<#
.SUMMARY
Query Marketplace feed
#>
function Get-ProductNameByDisplayNameFromMarketplaceFeed {
    [CmdletBinding()]
    param (
     [Parameter(Mandatory = $true)]
     [String] $productDisplayName,
    
     [Parameter(Mandatory = $true)]
     [String] $azureStorageAccountName,
    
     [Parameter(Mandatory = $true)]
     [String] $azureStorageKey
    )
    
    $TableName = 'MarketplaceFeed'
    $PartitionKey = 'BWFYA'
    
    $AzureStorageContext = New-AzureStorageContext -StorageAccountName $azureStorageAccountName -StorageAccountKey $azureStorageKey -Environment 'AzureCloud'
    $MarketplaceFeedTable = Get-AzureStorageTable -Name $TableName -Context $AzureStorageContext
    
    $productsFromFeed = Get-AzureStorageTableRowByCustomFilter -table $MarketplaceFeedTable -customFilter "(AutomationReady eq true) and (CertificationState ne 'Revoked') and (DisplayName eq '$productDisplayName')"
    $productsFromFeed.ProductName
}
    
<#
.SUMMARY
Query Marketplace feed
#>
function Get-ProductNamesFromMarketplaceFeed {
    [CmdletBinding()]
    param (
     [Parameter(Mandatory = $true)]
     [String] $azureStorageAccountName,
    
     [Parameter(Mandatory = $true)]
     [String] $azureStorageKey
    )
    
    $TableName = 'MarketplaceFeed'
    $PartitionKey = 'BWFYA'
    
    $AzureStorageContext = New-AzureStorageContext -StorageAccountName $azureStorageAccountName -StorageAccountKey $azureStorageKey -Environment 'AzureCloud'
    $MarketplaceFeedTable = Get-AzureStorageTable -Name $TableName -Context $AzureStorageContext
    
    $productsFromFeed = Get-AzureStorageTableRowByCustomFilter -table $MarketplaceFeedTable -customFilter "(AutomationReady eq true) and (CertificationState ne 'Revoked')"
    
    $productsWithLastRunDate = @{}
    if ($productsFromFeed) {
     $productsFromFeed | % { $productsWithLastRunDate.Add($_.ProductName, $_.LastRunDate)}
    }
    
    $productsWithLastRunDate
}
    
<#
.SUMMARY
Update Marketplace feed with test result
#>
function Update-ProductInFeedWithTestStatus {
    [CmdletBinding()]
    param (
     [Parameter(Mandatory=$true)]
     [string]$azureStorageAccountName,
    
     [Parameter(Mandatory=$true)]
     [string]$azureStorageKey,
    
     [Parameter(Mandatory=$true)]
     [string]$productName,
     
     [ValidateSet("N/A", "Passed", "Failed")]
     [string]$testStatus="N/A"
    )
    
    $TableName = 'MarketplaceFeed'
    $PartitionKey = 'BWFYA'
    
    $AzureStorageContext = New-AzureStorageContext -StorageAccountName $azureStorageAccountName -StorageAccountKey $azureStorageKey -Environment 'AzureCloud'
    $MarketplaceFeedTable = Get-AzureStorageTable -Name $TableName -Context $AzureStorageContext
    
    # Try to read product from storage, if it s found, 3-d party and not marked as Published yet, need to update Provisioning state
    $productSaved = Get-AzureStorageTableRowByColumnName -table $MarketplaceFeedTable -columnName "ProductName" -value $productName -operator Equal
    trap { Log-Info "Product $ProductName can't retrieve from the Marketplace feed. $_"; Continue }
    
    $productSaved.LastRunDate = (Get-Date).ToString()
    $productSaved.LastRunResult = $testStatus
    $productSaved.LastRunEnv = "staging"
    
    $productSaved | Update-AzureStorageTableRow -table $MarketplaceFeedTable
    trap { Log-Info "Product $ProductName with version $ProductVersion wasn't updated in the Marketplace feed. $_"; Continue }
}

<#
.SUMMARY
Gets JeaComputerName
#>
function Get-JeaComputerName
{
    param (
        [Parameter(Mandatory = $true)]
        [PSCredential] $azureCredential,

        [Parameter(Mandatory = $true)]
        [PSCredential] $domainCredential,
        
        [Parameter(Mandatory = $true)]
        [String] $azureSubscriptionId
    )

    Import-Module -Name Hyper-V -ErrorAction Stop -Verbose:$false 4>$null
    Login-AzureRmAccount -Credential $azureCredential -SubscriptionId $AzureSubscriptionId | Out-Null

    $customerManifest = Resolve-CustomerManifest 
    $vmHostNames = Get-VMHostNames -customerManifest $customerManifest
    $ListOfVms = Get-VMList -vmHostNames $vmHostNames -domainCredential $domainCredential
    $JeaComputerName = ($ListOfVms | Where-Object {$_.Name -ilike "*ERCS*"}).VmName
    if ($JeaComputerName.Count -gt 1)
    {
        $JeaComputerName = $JeaComputerName[0]
    }

    return $JeaComputerName
}

function Resolve-CustomerManifest
{
    # NOTE: Customer configuration file is largest file in C:\EceStore
    $customerManifestList = @()
    $customerManifestList += (Get-ChildItem -Path "C:\EceStore" -Filter "????????-????-????-????-????????????" -Recurse -File | Sort-Object Length -Descending).FullName
    foreach ($customerManifest in $customerManifestList)
    {
        if ($customerManifest -and (Test-Path -Path $customerManifest -PathType Leaf))
        {
            return $customerManifest
        }
    }

    return $null
}

function Get-VMHostNames
{
    param (
        [string] $customerManifest
    )

    $vmHostNames = @()
    if ($customerManifest)
    {
        Write-Verbose -Message "Using customer manifest '$customerManifest'." -Verbose
        $Configuration = [xml](Get-Content -Path $customerManifest)
        $bareMetalRole = $Configuration.CustomerConfiguration.SelectSingleNode("//Role[@Id='BareMetal']")
        $vmHostNames = $bareMetalRole.Nodes.Node.Name
    }
    else
    {
        Write-Warning -Message "Customer manifest '$customerManifest' not available."
        $vmHostNames = (Get-VMHost).Name
    }

    return $vmHostNames
}

function Get-VMList
{
    param (
        [Parameter(Mandatory = $true)]
        [PSCredential] $domainCredential,
        
        [string[]] $vmHostNames
    )

    $virtualMachines = @()
    foreach ($vmHostName in $vmHostNames)
    {
        Write-Verbose -Message "VMHost: $vmHostName" -Verbose
        
        $currentTrustedRoot = (Get-Item wsman:\localhost\Client\TrustedHosts).Value
        if([string]::IsNullOrEmpty($currentTrustedRoot) -or (-not $currentTrustedRoot.Contains($vmHostName)))
        {
            $allowAllHost = $false;
            foreach($trustHost in $currentTrustedRoot.Split(","))
            {
                if($trustHost -eq "*")
                {
                    $allowAllHost = $true;
                    break;
                }
            }

            if(-not $allowAllHost)
            {
                Set-Item wsman:\localhost\Client\TrustedHosts -Value "$currentTrustedRoot, $vmHostName" -Force
            }
        }

        $hostName = [System.Net.Dns]::GetHostName()
        if ($hostName -eq $vmHostName) {
            $vmHost = Get-VMHost -ComputerName $vmHostName
            $vms = Get-VM -ComputerName $vmHost.ComputerName
        } else {
            $vmHost = Get-VMHost -ComputerName $vmHostName -Credential $domainCredential
            $vms = Get-VM -ComputerName $vmHost.ComputerName -Credential $domainCredential
        }

        foreach ($vm in $vms)
        {
            $virtualMachines += $vm
        }
    }

    return $virtualMachines
}

function Get-NumberOfImagesToDownload
{
    $sizeRemaining = Get-RemainingCapacityOnMultinodePIR
    
    $imagesToDownload = [math]::Round($sizeRemaining / 30) - 1 # Consider that each image approximately has 30G capacity and 
    if ($imagesToDownload -ge 10) { 
     $imagesToDownload = 10
    }
    
    return $imagesToDownload
}

function Get-RemainingCapacityOnMultinodePIR
{
    $ClusterName = "S-Cluster"
    $sizeRemaining = 0
    
    # Calculate decreased number of images only on Multi-node env
    $v = (Get-VirtualDisk -CimSession $ClusterName) |  Get-Disk -CimSession $ClusterName | Get-Partition -CimSession $ClusterName | Get-Volume -CimSession $ClusterName
    if ((Get-ClusterNode -Cluster $ClusterName).Count -gt 1) {
        $s = $v | ? { $_.FileSystemLabel -eq 'ObjStore_1' }
        $sizeRemaining = $s.SizeRemaining
    } else {
        $s = $v | ? { $_.FileSystemLabel -eq 'SU1_Volume' }
        $sizeRemaining = $s.SizeRemaining
    }
    
    return $sizeRemaining / (1024 * 1024 * 1024)
}

function Log-DeploymentTableAndErrors
{
    param(
        [Parameter(Mandatory = $false)]
        [object] $DeploymentResource
    )

    $containsErrors = $false

    if($DeploymentResource)
    {
        $DeploymentResource.Properties | Format-Table @{"Name"="ResourceType"; "Expression"={$_.TargetResource.ResourceType}}, 
                            @{"Name"="ResourceName"; "Expression"={$_.TargetResource.ResourceName}},
                            ProvisioningOperation,
                            StatusCode, 
                            ProvisioningState, 
                            Duration,
                            @{"Name"="ErrorCode"; "Expression"={$_.StatusMessage.Error.Code}},
                            @{"Name"="ErrorTarget"; "Expression"={$_.StatusMessage.Error.Target}},
                            @{"Name"="ErrorMessage"; "Expression"={$_.StatusMessage.Error.Message}} | Out-File $Global:wkLogFile -Append -width 10000

        foreach($error in $deployRes.Properties.StatusMessage.Error)
        {
            $errorMessage += "Deployment Failure. ErrorCode: '$($error.Code)' ErrorTarget: '$($error.Target)' ErrorMessage: '$($error.Message)'`n"
        }

        if($errorMessage)
        {
            $containsErrors = $true

            Log-Error $errorMessage
        }
    }

    return $containsErrors
}


function Test-TemplateDeploymentCurrentUser {
    param
    (
        [String[]] $Services = @("Microsoft.Compute", "Microsoft.Storage", "Microsoft.Network"),

        [Parameter(Mandatory = $true)]
        [String[]] $TemplateFileUrl,

        [String[]] $TemplateParameterFileUrl,

        [Parameter(Mandatory = $true)]
        [bool] $DoNotDelete,

        [bool] $StopVmOnFailure = $false,

        [bool] $VmCreated = $true,

        [String] $ResourceGroup,


        [string[]] $RemoveParameters,

        [hashtable[]] $UpdatedParameterValue,

        [hashtable[]] $AdditionalParameters,

        $Results
    )

    if ($TemplateParameterFileUrl) { $templateParameterFilePresented = $true } else { $templateParameterFilePresented = $false } 

    $allTimers = @()


    if(!$Results) {
        $Results = @{}
    }
    $Results.VmDeploymentTimesRaw = @{}
    $Results.VmScaleSetTimeRaw = @{}
    $Results.VmDeploymentCount = @{}
    $Results.VmDeploymentCount.Total = 0
    $Results.VmDeploymentCount.Passed = 0
    $Results.VmDeploymentCount.Failed = 0
    $Results.TotalDeploymentTimeInSec = 0




    $deploymentFailure = $false

    try {
        Log-Info "Creating resource group $ResourceGroup"
        $curTimer = Start-WkTimer -TimerName "Resource Group Creation $ResourceGroup"
        $rgCreated = New-AzureRmResourceGroup -Name $ResourceGroup -Location $Global:AzureStackConfig.ArmLocation -Force *>> $Global:wkLogFile
        $allTimers += End-WkTimer -TimerName "Resource Group Creation $ResourceGroup" -Timer $curTimer
        Log-Info "Done creating resource group $ResourceGroup"

        $curTemplate = 0;
        foreach($template in $TemplateFileUrl) {

            $templateNameElements =  $template.split("\/")
            if($templateNameElements.Count -ge 2) {
                $templateName = $templateNameElements[-2]
            }
            else {
                $templateName = $template
            }
            $deploymentName = $templateName + "-Deployment"
            Log-Info "Template to deploy: $templateName"

            $templateFile = Download-File -FileUrl $template
            Log-Info ("Template File Location: {0}" -f $templateFile)
            Write-Verbose "Template file $templateFile"
            
            if ($templateParameterFilePresented) {
                $templateParameterFile = Download-File -FileUrl $TemplateParameterFileUrl[$curTemplate]
                Log-Info ("Template parameter File Location: {0}" -f $templateParameterFile)
                Write-Verbose "Template param file $templateParameterFile"
                Replace-MaskCharacter -FilePath $templateParameterFile
                Replace-PasswordPlaceholder -FilePath $templateParameterFile

                if(($UpdatedParameterValue -ne $null) -and $UpdatedParameterValue.Count -gt 0) {
                    if($UpdatedParameterValue[$curTemplate]) {
                        $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                        foreach($key in $UpdatedParameterValue[$curTemplate].Keys) {
                            #$json.parameters.$key.value = $UpdatedParameterValue.$key
                            $value = $UpdatedParameterValue[$curTemplate].$key
                            $entry = @{
                                value = $value
                            }
                            $json.parameters | Add-Member -Type "NoteProperty" -Name $key -Value $entry -Force
                        }
                        ConvertTo-Json $json | Out-File $templateParameterFile
                    }
                }

                if(($AdditionalParameters -ne $null) -and $AdditionalParameters.Count -gt 0) {
                    if($AdditionalParameters[$curTemplate]) {
                        Log-Info "Adding additional paramters to template file"
                        $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                        foreach($key in $AdditionalParameters[$curTemplate].Keys) {
                            Log-Info "Adding value $($AdditionalParameters[$curTemplate].$key) to key $key"
                            $newPair = New-Object -TypeName PSObject
                            $keyValue = @{"value" = $AdditionalParameters[$curTemplate].$key}
                            #$newValue = [int]$($AdditionalParameters[$curTemplate].$key)
                            $newValue = $($AdditionalParameters[$curTemplate].$key)
                            $newPair | Add-Member -PassThru NoteProperty "value" $newValue

                            $json.parameters | Add-Member -PassThru NoteProperty $key $newPair
                            #$json.parameters.$key | add-member -PassThru NoteProperty value $AdditionalParameters[$curTemplate].$key
                        }
                        Log-Info $json
                        ConvertTo-Json $json | Out-File $templateParameterFile
                    }
                }

                if(($RemoveParameters -ne $null) -and $RemoveParameters.Count -gt 0) {
                    Log-Info "Removing paramters from template file"
                    $json = (Get-Content -Path $templateParameterFile) -join "`n" | ConvertFrom-Json

                    foreach($param in $RemoveParameters) {
                        $json.parameters = $json.parameters | Select-Object * -ExcludeProperty $param
                    }
                    Log-Info $json
                    ConvertTo-Json $json | Out-File $templateParameterFile
                }

                $paramFileContent = [IO.File]::ReadAllText($templateParameterFile)
            }
                
            $templateFileContent = [IO.File]::ReadAllText($templateFile)

            Log-Info "Parameter file content:"
            #Log-Info "$paramFileContent"
            $paramFileContent *>> $Global:wkLogFile
            Log-Info "Template file content:"
            $templateFileContent *>> $Global:wkLogFile
            #Log-Info "$templateFileContent"

            #Log-Info ("Parameter file content: {0}" -f ([IO.File]::ReadAllText($templateParameterFile)))
            #Log-Info ("Template file content: {0}" -f ([IO.File]::ReadAllText($templateFile)))
            #test the template and parameters file
            try {
                if ($templateParameterFilePresented) {
                    Test-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateParameterFile $templateParameterFile -TemplateFile $templateFile
                } else {
                    Test-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroup -TemplateFile $templateFile
                }
            }
            catch {
                Write-Error "Template validation failed on $templateFile $templateParameterFile $_"
                throw $_
            }
            Log-Info "Starting resource group deployment $deploymentName"
            $curTimer = Start-WkTimer -TimerName "New Resource Group Deployment $templateName"
            
            if ($templateParameterFilePresented) {
                New-AzurermResourceGroupDeployment -Name $deploymentName -ResourceGroupName $ResourceGroup -TemplateFile $templateFile -TemplateParameterFile $templateParameterFile -Verbose *>> $Global:wkLogFile
            } else {
                New-AzurermResourceGroupDeployment -Name $deploymentName -ResourceGroupName $ResourceGroup -TemplateFile $templateFile -Verbose *>> $Global:wkLogFile
            }

            $Results.TotalDeploymentTimeInSec = [int]((Get-Date) - $curTimer).TotalSeconds
            $allTimers += End-WkTimer -TimerName "New Resource Group Deployment $templateName" -Timer $curTimer
            Log-Info "Resource group deployment finished on $deploymentName"

            # Check results of deployment, throw if there is a failure.
            # New-AzurermResourceGroupDeployment does not throw on all errors in deployment
            Log-Info "Deployment table for deployment: $deploymentName"
            $deployRes = Get-AzureRmResourceGroupDeploymentOperation -DeploymentName $deploymentName -ResourceGroupName $ResourceGroup -Verbose

            $null = Log-DeploymentTableAndErrors -DeploymentResource $deployRes

            $tableLogged = $true
            $creationFailed = $false

            foreach ($res in $deployRes) {
                if ($res.Properties.TargetResource.ResourceType -eq "Microsoft.Compute/virtualMachines") {
                    $Results.VmDeploymentTimesRaw.$($res.Properties.TargetResource.ResourceName) = $res.Properties.Duration
                    $Results.VmDeploymentCount.Total++

                    if ($res.Properties.StatusCode -eq "OK") {
                        $Results.VmDeploymentCount.Passed++
                    }
                    else {
                        $Results.VmDeploymentCount.Failed++
                    }
                }

                if ($res.Properties.TargetResource.ResourceType -eq "Microsoft.Compute/virtualMachineScaleSets") {
                    $Results.VmScaleSetTimeRaw.$($res.Properties.TargetResource.ResourceName) = $res.Properties.Duration
                }

                if ($res.Properties.StatusCode -ne "OK" -and $res.Properties.StatusCode -ne "Created") {
                    $creationFailed = $true
                }
            }

            if ($creationFailed) {
                $deploymentFailure = $true
                if($StopVmOnFailure){
                    Log-Info "Stopping VM for Failure"
                    $DoNotDelete = $true
                }

                $errMsg = "Deployment failed. See deployment table for detailed information."

                Log-Error  $errMsg
                throw $errMsg
            }
            $curTemplate++
        }
    }
    finally {
        if($tableLogged -eq $false) {
            try 
            {
                $deployRes = Get-AzureRmResourceGroupDeploymentOperation -DeploymentName $deploymentName -ResourceGroupName $tenantRGName -Verbose
            }
            catch {
                Log-Error "Failed to get deployment table. Deployment might not have started"
                Log-Error "$_"
            }

            $null = Log-DeploymentTableAndErrors -DeploymentResource $deployRes
        }
        if($VmCreated -eq $true) {
            try {
                $vms =  Get-AzureRmVM -ResourceGroupName $tenantRGName
                foreach($vmname in $vms.Name) {
                    $status = Get-AzureRmVM -ResourceGroupName $tenantRGName -Status -Name $vmname
                    Log-Info $status.Name
                    Log-Info $status.ExtensionsText
                    Log-Info $status.StatusesText
                    Log-Info $status.BootDiagnosticsText
                    Log-Info $status.DisksText
                    Log-Info $status.VMAgentText
                }
            }
             catch {
                $deploymentFailure = $true
                if($StopVmOnFailure){
                    Log-Info "Stopping VM for Failure"
                    $DoNotDelete = $true
                }
                Log-Error "Failed to get VMs. No VMs may have been created"
                Log-Error "$_"
            }
        }

        # Delete the resource group in the tenant subscription context
        if (!$DoNotDelete) {
            Log-Info "Removing resource group $ResourceGroup"
            $curTimer = Start-WkTimer -TimerName "Remove Resource Group $ResourceGroup"
            Remove-AzureRmResourceGroup -Name $ResourceGroup -Force *>> $Global:wkLogFile
            $allTimers += End-WkTimer -TimerName "Remove Resource Group $ResourceGroup" -Timer $curTimer
            Log-Info "Done removing resource group $ResourceGroup"

        }
        if($StopVmOnFailure -and $deploymentFailure){
            Log-Info "Stopping VM"
            Stop-VmOnFailure -resourceGroup $ResourceGroup
        }        
    }

    Log-Timer -Timers $allTimers -TableName "Template Deployment"
    return $results
}
