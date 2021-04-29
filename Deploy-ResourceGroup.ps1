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

        $templateFile = "resourceGroup.json"
        Write-Output $templateFile
        $aksResourceGroup = "Temenos-AKS"
        Write-Output $aksResourceGroup
        $location = "east-us"
        Write-Output $location
        

        ########### Creating deployment parameter set ###########

        $resourceGroup = az group exists --name $aksResourceGroup
        Write-Output $resourceGroup

        if ($resourceGroup)
        {
         Write-Output ("################################ Creating ResourceGroup ####################################")
            $Parameters = @{ 
                templateFile = $templateFile
                templateParameterObject = @{
                   aksResourceGroup = $aksResourceGroup
                   location = $location
                }
            }
 $result = az group deployment create --name mydeployment --resource-group $aksResourceGroup @Parameters
            Write-Output $result
        }
        else {
            Write-Output ("ResourceGroup already exists")
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
