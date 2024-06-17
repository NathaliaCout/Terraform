Objetivo:

Habilitar Logs detalhados no Terraform.

[Hands-On] Debugging Terraform

1- Habilitar log.  
export TF_LOG=TRACE  
ou  
$env:TF_LOG = "TRACE"


2- Habilitar e configurar o Logging Path.  
export TF_LOG_PATH="terraform_log.txt"    
ou      
$env:TF_LOG_PATH = "terraform_log.txt"   

#Para consumir os dados do txt execute:
cat .\terraform_log.txt

3- Desabilitar Logs.      
export TF_LOG=""  
ou  
$env:TF_LOG = ""  
$env:TF_LOG_PATH = ""