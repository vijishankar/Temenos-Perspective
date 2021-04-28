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

        
          
           az group deployment create --parameters "{\"location\": { \"value\": \"east-us\" }, \"aksResourceGroup\": { \"value\": \"Temenos-AKS\" }}" --template-file resourceGroup.json
         

        

      

    }
}
Deploy-ResourceGroup
