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
			   
			   vijishankar/Deploy-ResourceGroup.ps1
			   
			   '''
			}
		}
	}
      }
}	
