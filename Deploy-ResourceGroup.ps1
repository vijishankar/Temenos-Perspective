Function New-CoreResourceGroup
{
    <#
    .SYNOPSIS
        This function creates a new resource groups for core

    .DESCRIPTION
        This function creates a new resource group with the specified parameters from pipeline

    .EXAMPLE
        PS C:\> New-ResourceGroup.ps1
#>
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute(
            "PSUseShouldProcessForStateChangingFunctions",
            "",
            Justification = "The function creates a new resource groups as expected."
    )]
    [CmdletBinding()]
    Param ()
    begin {
        #Placeholder for VSTS pipeline integration
        # $payload = $Env:payload
    }
    process {

        $startTime = (Get-Date)
        ######### Getting Azure DevOps variables ###########

        $aksResourceGroup = $Env:AKSRESOURCEGROUP
        $environment = $Env:ENVIRONMENT
        $location = $Env:LOCATION

        #Check if the spoke resource group alredy exists

        $resourceGrtoup = Get-AzResourceGroup -Name $aksResourceGroup -ErrorAction SilentlyContinue

        if (!$resourceGrtoup)
        {
            #Create new resource group

            $Parameters = @{
                name = $aksResourceGroup
                location = $location
                tags = @{
                    environment = $environment
                    applicationName = "AksResourceGroup"
                }
            }
            Write-Output $Parameters
            $result = New-AzResourceGroup @Parameters
            Write-Output $result -Verbose
        }

        $endTime = (Get-Date)
        'Script Duration --> {0:mm} min {0:ss} sec' -f ($endTime-$startTime)
    }
}
New-CoreResourceGroup
