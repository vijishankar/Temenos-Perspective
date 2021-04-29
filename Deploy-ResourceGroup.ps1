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
        write output $templateFile
        $aksResourceGroup = "Temenos-AKS"
        write output $aksResourceGroup
        $location = "east-us"
        write output $location
        

        ########### Creating deployment parameter set ###########

        $resourceGroup = az group exists --name $aksResourceGroup
        write output $resourceGroup

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
            $result = az group deployment create @Parameters
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
