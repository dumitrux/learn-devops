terraform init
terraform frmt
terraform plan

terraform apply -help
terraform apply
terraform apply -auto-approve
terraform apply -replace azurerm_linux_virtual_machine.mtc-vm
terraform apply -refresh-only

terraform state list
terraform state show azurerm_resource_group.mtc-rg
terraform state show azurerm_public_ip.mtc-nic

terraform output
terraform output public_ip_address

terraform refresh

terraform plan -destroy
terraform apply -destroy
terraform destroy
