Function Test-KubernetesDeploy
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



                         az aks get-credentials --resource-group Temenos-POC-RG --name AKS-Temenos 
		     
		                    /usr/local/bin/kubectl get nodes
		     
		                    /usr/local/bin/kubectl apply -f k8s-deployment.yaml --validate=false
				    
				                /usr/local/bin/kubectl get pods
				    
				                /usr/local/bin/kubectl get services


        
        $endTime = (Get-Date)
        'Script Duration --> {0:mm} min {0:ss} sec' -f ($endTime-$startTime)

    }
    END
    {
        Write-Host "In End block"
    }
}


Test-KubernetesDeploy


