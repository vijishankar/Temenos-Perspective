pipeline {
    agent any
 
    environment {
       
       AZURE_SUBSCRIPTION_ID='4917809c-4753-4722-81bf-a1b4429fd9ca'
       AZURE_TENANT_ID='819948b9-e473-435d-b429-6f100444732f'
	   
	   
	   
	   AZURE_CLIENT_ID = '1c169129-ce1e-4cd7-8699-8a4133f36a9b'
        AZURE_CLIENT_SECRET = 'oR7zj49HA~9UR3bMM9~4MHlS2MKZfdOsTU'
        APP_URL = 'http://azure-cli-2021-04-27-15-03-17'
        
    }

    stages {
		stage('Example') {
            steps {
                   withCredentials([usernamePassword(credentialsId: 'myAzureCredential', passwordVariable: 'CLIENT_SECRET', usernameVariable: 'AZURE_CLIENT_ID')]) {
                          
			   sh '''
			   
                                    az login --service-principal -u $AZURE_CLIENT_ID -p $CLIENT_SECRET -t $AZURE_TENANT_ID
			  
				    
				    '''
			//load "${Workspace}/Deploy-ResourceGroup.ps1"
		      echo Deploy-ResourceGroup()
						
				}
			}
		}
	    
	    
	    
	    dev Deploy-ResourceGroup() {

    [CmdletBinding()]
    Param (  )
    begin { }
    process {  }

       

        $templateFile = "resourceGroup.json"
        $aksResourceGroup = "Temenos-AKS"
        $location = "east-us"
        

       
        $resourceGroup = Get-AzResourceGroup -Name $aksResourceGroup -ErrorAction SilentlyContinue

        if (!$resourceGroup)
        {
           
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

        $endTime = (Get-Date)
        'Script Duration --> {0:mm} min {0:ss} sec' -f ($endTime-$startTime)

    }
}
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

        $startTime = (Get-Date)

      
        $scriptRoot = "$Env:SYSTEM_DEFAULTWORKINGDIRECTORY\$Env:RELEASE_PRIMARYACTIFACTSOURCEALIAS"
        Write-Output ("Script root is {0}" -f $scriptRoot)
        Get-Childitem –Path $scriptRoot -Include *.psm1 -Recurse | ForEach-Object {
            Import-Module (Resolve-Path($_)) -Force
            Write-Output ("Importing module {0}" -f $_)
        }

        

        $templateFile = "resourceGroup.json"
        $aksResourceGroup = "Temenos-AKS"
        $location = "east-us"
        

        

        $resourceGroup = Get-AzResourceGroup -Name $aksResourceGroup -ErrorAction SilentlyContinue

        if (!$resourceGroup)
        {
            
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

        $endTime = (Get-Date)
        'Script Duration --> {0:mm} min {0:ss} sec' -f ($endTime-$startTime)

    }
}
	    
	    
      }
}	
