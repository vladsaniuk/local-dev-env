# Local dev environment  
Start Jenkins with:   
`docker compose up --build --detach && docker exec -u 0 -it jenkins bash -c "chmod 666 /var/run/docker.sock"`  
Go to Jenkins and SonarQube UI, update username and password.     
Add vars in local.tfvars file in iac folder:
* jenkins_username, jenkins_password,    
* sonarqube_username, sonarqube_password.       

Run Terraform to configure Jenkins and SonarQube with:     
```
terraform init
terraform plan -var-file local.tfvars
```
Go to Jenkins UI and populate created placeholders for required secrets.   
To run Sonar Scanner you need to use it in Docker container and provide configs as env vars, as specified here: https://docs.sonarsource.com/sonarqube/9.9/analyzing-source-code/scanners/sonarscanner/#sonarscanner-from-docker-image     
To wait for Quality Gate results you need to provide flag `-Dsonar.qualitygate.wait=true`, default timeout is 300 sec.