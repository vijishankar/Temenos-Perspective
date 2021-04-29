Function Test-ScriptBlock
{
    Param
    ( 
    )
    BEGIN
    {    
    }
 
    PROCESS
    {
        $startTime = (Get-Date)

        ##### Import custom modules ########
        $scriptRoot = "$Env:SYSTEM_DEFAULTWORKINGDIRECTORY\$Env:RELEASE_PRIMARYACTIFACTSOURCEALIAS"
        Write-Output ("Script root is {0}" -f $scriptRoot)
        Get-Childitem –Path $scriptRoot -Include *.psm1 -Recurse | ForEach-Object {
            Import-Module (Resolve-Path($_)) -Force
            Write-Output ("Importing module {0}" -f $_)
        }

        ###### Getting Azure DevOps variables ########

        $templateFile = "aks.json"
        Write-Output $templateFile
        $ParameterFile = "aks.parameters.json"
        $aksResourceGroup = "Temenos-ARM"
        Write-Output $aksResourceGroup
        $location = "eastus"
        Write-Output $location
        

        ########### Creating deployment parameter set ###########

        $resourceGroup = az group exists --name $aksResourceGroup
        Write-Output $resourceGroup

        if (!$resourceGroup)
        {
         Write-Output ("################################ Creating resourcegroup ####################################")
                    az deployment group create --name mydeployment --resource-group $aksResourceGroup --template-file $templateFile --parameters $ParameterFile
        }
        else {
           Write-Output ("################################ Creating resourcegroup and AKS ####################################")
           
                    az group create -l $location -n $aksResourceGroup
           
                    az deployment group create --name mydeployment --resource-group $aksResourceGroup --template-file $templateFile --parameters $ParameterFile
        }

        $endTime = (Get-Date)
        'Script Duration --> {0:mm} min {0:ss} sec' -f ($endTime-$startTime)

    }
    END
    {
        Write-Host "In End block"
    }
}


Test-ScriptBlock
