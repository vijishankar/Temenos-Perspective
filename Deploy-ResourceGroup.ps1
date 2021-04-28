Function Deploy-ResourceGroup {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [Int]$capacity = 2
    )
    begin {
        
    }
    process {
        }

        ###### Getting Azure DevOps variables ########
 
       
       
        

        ########### Creating deployment parameter set ###########

        $resourceGroup = Get-AzResourceGroup -Name $aksResourceGroup -ErrorAction SilentlyContinue

        if (!$resourceGroup)
        {
            Write-Output ("################################ Creating ResourceGroup ####################################")
            $Parameters = @{ 
                templateFile = "resourceGroup.json"
                Verbose = $true
                templateParameterObject = @{
                   $aksResourceGroup = "Temenos-AKS"
                   $location = "east-us"
                }
            }
            $result = New-AzResourceGroupDeployment @Parameters
            Write-Output $result

        }
        else {
            Write-Output ("ResourceGroup already exists")
        }

       
        

    }
}
Deploy-ResourceGroup
