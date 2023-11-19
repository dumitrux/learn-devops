az login --use-device-code
az account show
az account set --subscription <subscription_id>

az group list --query "[?name=='mtc-resources']"
az network vnet subnet list -g rg-mock --vnet-name vnet-mock --query "[?name=='subnet-mock']"

az vm image list --all --publisher="Canonical" > images.json
az vm image list --all --publisher="Canonical" --sku="22_04-lts-gen2"
