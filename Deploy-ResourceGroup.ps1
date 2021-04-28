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

        
            $Parameters = @{ 
                templateParameterObject = @{
                   aksResourceGroup = 'Temenos-AKS'
                   location = 'east-us'
                }
                }
           az group deployment create @Parameters --template-file resourceGroup.json
         

        

      

    }
}
Deploy-ResourceGroup
