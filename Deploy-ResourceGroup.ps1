  ###### Getting Azure DevOps variables ########

        $templateFile = "resourceGroup.json"
        $aksResourceGroup = "Temenos-AKS"
        $location = "east-us"
        

        ########### Creating deployment parameter set ###########

        $resourceGroup = Get-AzResourceGroup -Name $aksResourceGroup -ErrorAction SilentlyContinue

        if (!$resourceGroup)
        {
            Write-Output ("################################ Creating ResourceGroup ####################################")
            $Parameters = @{ 
                templateFile = $templateFile
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

       

