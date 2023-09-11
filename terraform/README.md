- [Terrform info](#terrform-info)
  - [Locals](#locals)
  - [Modules](#modules)
  - [Count vs For\_each](#count-vs-for_each)
  - [Import vs Data Source](#import-vs-data-source)
  - [Features Block](#features-block)
  - [Dynamic Blocks](#dynamic-blocks)
  - [Override](#override)
- [Terrform practice](#terrform-practice)
  - [Install Terraform](#install-terraform)
  - [Conenct to Azure](#conenct-to-azure)
  - [Azure Storage account](#azure-storage-account)
  - [Terraform commands](#terraform-commands)
  - [Terraform code](#terraform-code)
  - [Access the VM](#access-the-vm)
  - [Custom data](#custom-data)
  - [Install remote SSH VSC extension to access the remote VM](#install-remote-ssh-vsc-extension-to-access-the-remote-vm)
  - [Data sources](#data-sources)
  - [Outputs](#outputs)
  - [Variables](#variables)
  - [Conditionals](#conditionals)

# Terrform info
References:
https://youtube.com/playlist?list=PLnWpsLZNgHzVVslxs8Bwq19Ng0ff4XlFv

- Use the resources instead of variables to set a dependency on the creation of the resource.
- Terraforms treats all the divided .tf files as the same file.

## Locals
- To assign a name to an expression.
- Update the local to modify all instance of the expression.
- Helps with repeating values.
- Overuse can make code difficult to read.

## Modules
- Reusable code.
- Collection of resources.
- Accepts inputs, produces outputs.
- Modules are not a single instance of a resource.
- Modules is a collection of resources.

Example: https://github.com/tsrob50/TerraformExamples/tree/main/ModuleExample

## Count vs For_each
**Count**
Use count if the instances of the resources are almost identical.
Using the index to identify the different instances.

**For_each**
Multiple versions of similar versions.
Uses areguments where the value is mapped to a set of strings.
Map is a key value pair.

Example: https://github.com/tsrob50/TerraformExamples/tree/main/VNetandBastionHost

## Import vs Data Source
**Import**
- Imports infraestructure into Terraform management.
- Added to Terraform state and managed by Terraform going forward.

**Data Source**
- Allows Terraform to define and use existing infraestructure.
- Not managed by Terraform.
- Data refreshed during Terraform Plan.

## Features Block
Docs: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block

## Dynamic Blocks
Use for reosurce that have repetable nested blocks in their arguments.
For example, servers can hhave multiple disks or NICs.

A for_each loop is used to create multiple similar instances of an object such as a resource.
A Dynamic Block uses a for_each loop to create multiple copies of a sub-resource nested inside a resource.

Example: https://github.com/tsrob50/TerraformExamples/tree/main/DynamicNSG

## Override
Avoid using.
Useful for automation, it changes settings without modifying source files.

Override file allows to override values in a Terraform deployment.
It consists of a set of configurations that replace the values in existing .tf files.

After all the .tf files are processed by Terraform, the override files are merged into the configuration. The merge replaces the values supplied by the configuration files.

The name convention is important.
The files are processed or merged in lexicographical order (alphabetic order).
Override File Names:
- override.tf, override.tf.json
- test_override.tf, test_override.tf.json

<br>

# Terrform practice
References:
- https://youtu.be/V53AHWun17s

## Install Terraform
1. Donwload terraform.exe
2. Move to "C:\Program Files\Terraform"
3. Edit PATH environment variable
4. `terraform --version`

## Conenct to Azure
Azure CLI
```bash
az login --use-device-code
az account show
az account set --subscription <subscription_id>

az group list --query "[?name=='mtc-resources']"
az network vnet subnet list -g rg-mock --vnet-name vnet-mock --query "[?name=='subnet-mock']"

az vm image list --all --publisher="Canonical" > images.json
az vm image list --all --publisher="Canonical" --sku="22_04-lts-gen2"
```

## Azure Storage account
The Storage account name has to be unique.

Do not create the Storage Account with Terraform.
Consider that the Terraform state file in the Storage Account is not a stateless resource.
Meaning it cannot be destroyed and recreat it as needed.
There is state date in the Storage Account needed for deployments.

The ACCOUNT_KEY is not needed if the deployment is don trough a Pipeline.

```bash
$SUBCRIPTION_NAME=''
$RESOURCE_GROUP_NAME='rg-tfstate'
$STORAGE_ACCOUNT_NAME="tfstate01$(get-random)"
$CONTAINER_NAME='tfstate'

# Set subscription to be the current active subscription.
az account show
az account set --subscription <subscription_id>

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

#Get the storage access key and store it as an environment variable
$ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv) 
$env:ARM_ACCESS_KEY=$ACCOUNT_KEY
```

Docs: https://developer.hashicorp.com/terraform/language/settings/backends/azurerm

## Terraform commands
```bash
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
```

## Terraform code
State file and its backup, do not modify unless is strictly necessary.
More info: https://developer.hashicorp.com/terraform/language/state

In mtc-test-rule.source_address_prefix, should be your public IP to connect to the Azure resources from local.

## Access the VM
Create SSH key to access the VM:
```bash
ssh-keygen -t rsa
> C:\Users\dumitrux/.ssh/privatekey

ls ~/.ssh
```

SSH into the VM
```bash
terraform state show azurerm_public_ip.mtc-vm

ssh -i ~/.ssh/privatekey adminuser@<vm_ip>
lsb_release -a
```

## Custom data
This will delete and create the VM
```bash
ssh -i ~/.ssh/privatekey adminuser@<vm_ip>
docker --version
```

## Install remote SSH VSC extension to access the remote VM
1. Install VSC extension "Remote - SSH"
2. Open Command Palette (Ctrl+Shift+P)
3. Type "Remote-ssh: Add New SSH Host..."
4. Type "ssh adminuser@<vm_ip>"
5. Chose "~/.ssh/config" directory
6. Open config file
7. Create "windows-ssh-script.tpl" and "linux-ssh-script.tpl"
8. Add the "provisioner" attribute in the "azurerm_linux_virtual_machine"
9. Redeploy all `terraform apply -replace azurerm_linux_virtual_machine.mtc-vm`
10. Type "Remote-ssh: Connect to Host..." on the Command Palette
11. Select the identifier of the remote machine
12. Select Linux
13. Click "Continue" on the provided fingerprint
14. Wait for docker to be installed and check with `docker -version`

## Data sources
1. Add `data "azurerm_public_ip" "mtc-ip-data"` in the code
2. Run `terraform apply -refresh-only`
3. The data will be at the top of the state file
4. Check the data with `terraform state list`
5. Check the value of the data with `terraform state show data.azurerm_public_ip.mtc-ip-data`

## Outputs
1. Add `output "public_ip_adrress"` in the code
2. Check value with `terraform state show data.azurerm_public_ip.mtc-ip-data`
3. Run `terraform apply -refresh-only`
4. Run `terraform output` or `terraform output public_ip_address`

## Variables
1. Add `${var.host_os}` in the templatefile of the VM provisioner
2. Create `variables.tf` with the `host_os`variable and plan the deployment
3. Add the attribute `default` to the `variables.tf` file
4. Run `terraform console` and type `var.host_os`
5. Comment the `default` attribute
6. Create `terraform.tfvars`
7. Run `terraform console` and type `var.host_os`
7. Run `terraform console -var="host_os=linux"` and type `var.host_os`
8. Create `osx.tfvars`
9. Run `terraform console -var-file="osx.tfvars"` and type `var.host_os`

## Conditionals
1. Syntax `condition ? true_val : false_val`
2. Add the conditional in the VM provisioner
3. Run `terraform apply -auto-approve`
