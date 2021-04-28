Function Deploy-ResourceGroup {

    [CmdletBinding()]
    Param (
       
    )
    begin {
        # $payload = $Env:payload
    }
    process {

        
        }

        ###### Getting Azure DevOps variables ########

       
         
        

        ########### Creating deployment parameter set ###########

        
          
           az group deployment create \
           --parameters location = east-us \
           aksResourceGroup = Temenos-AKS" \
           --template-file resourceGroup.json
         

        

      

    }
}
Deploy-ResourceGroup
