Function Deploy-ResourceGroup {

    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $false)]
        [Int]$capacity = 2
    )
    begin {
        # $payload = $Env:payload
    }
    process {

        
        }

        ###### Getting Azure DevOps variables ########

       
         
        

        ########### Creating deployment parameter set ###########

        $resourceGroup = az group exists --name $aksResourceGroup

        if (!$resourceGroup)
        {
            Write-Output ("################################ Creating ResourceGroup ####################################")
            $Parameters = @{ 
                templateParameterObject = @{
                   aksResourceGroup = 'Temenos-AKS'
                   location = 'east-us'
                }
            }
            $result = az group deployment create @Parameters --template-file resourceGroup.json
            Write-Output $result

        }
        else {
            Write-Output ("ResourceGroup already exists")
        }

      

    }
}
Deploy-ResourceGroup
