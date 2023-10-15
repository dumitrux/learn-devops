# https://github.com/Azure/AzureAuth
# use the R package "AzureAuth" to get data from Azure services and the VM has active the "Managed service identity" feature
# Enable manage identity on the AKS (https://learn.microsoft.com/en-us/azure/aks/use-managed-identity#update-an-aks-cluster-to-use-a-managed-identity)

token <- get_managed_token("https://vault.azure.net")
vault <- key_vault("ceppkeyvault", token=token)
secret <- vault$secrets$get("CosmosDBKey")
endp <- cosmos_endpoint("https://treatydata.documents.azure.com:443/", key=secret[["value"]])
db <- get_cosmos_database(endp, "treaty")