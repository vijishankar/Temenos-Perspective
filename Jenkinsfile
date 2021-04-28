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
		 stage('Deploying Resource') {
            steps {
                container('azure') {
                    pwsh ''' 
                            ############################### Powershell #############################
                            
                            $passwd = ConvertTo-SecureString $env:AZURE_CLIENT_SECRET -AsPlainText -Force
                            $pscredential = New-Object System.Management.Automation.PSCredential($env:AZURE_CLIENT_ID, $passwd)
                            Connect-AzAccount -ServicePrincipal -Credential $pscredential -Tenant $env:AZURE_TENANT_ID | Out-null
                            #Write-Output "Azure Subscription is "$Env:AZURE_SUBSCRIPTION_ID""
                            Select-AzSubscription -Subscription "$Env:AZURE_SUBSCRIPTION_ID" | Set-AzContext | Out-null
                            
                            az login --service-principal -u $Env:APP_URL -p $Env:AZURE_CLIENT_SECRET --tenant $Env:AZURE_TENANT_ID | Out-null
							
							'''
							}
							}
							}
      }
}	
