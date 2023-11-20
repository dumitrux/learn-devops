# :simple-databricks: Databricks useful commands

## Bash script in DevOps Release

```bash
databricks_path="$(System.DefaultWorkingDirectory)/_<Repo_name>/databricks-scripts/"
databricks_url="https://<databricks_id>.azuredatabricks.net"
```

## Get Azure AD tokens for the service principal

```bash
access_token=$(curl -X POST -H 'Content-Type: application/x-www-form-urlencoded' \
https://login.microsoftonline.com/<tenant_id>/oauth2/v2.0/token \
-d 'client_id=$(spclientid)' \
-d 'grant_type=client_credentials' \
-d 'scope=<scope>.default' \
-d 'client_secret=$(spclientsecret)' \
| jq -r .access_token)
```

## Use the service principal’s Azure AD access token to access the Databricks REST API

```bash
curl -X POST \
-H "Authorization: Bearer $access_token" \
$databricks_url/api/2.0/preview/scim/v2/ServicePrincipals \
-H 'Content-type: application/scim+json' \
-d @"$databricks_path/create-service-principal.json"
```

## Create a cluster with the configuration in create-cluster.json

```bash
curl -X POST \
-H "Authorization: Bearer $access_token" \
$databricks_url/api/2.0/clusters/create \
-d @"$databricks_path/create-cluster.json"
```

## Upload the mount script into Databricks Shared workspace

```bash
curl --request POST \
-H "Authorization: Bearer $access_token" \
$databricks_url/api/2.0/workspace/import \
--header 'Content-Type: multipart/form-data' \
--form path=/Shared/mount-dir \
--form content=@"$databricks_path/mount-dir.py.zip"
```

## List the clusters to find a specific one

```bash
cluster_id=$(curl -X GET \
-H "Authorization: Bearer $access_token" \
$databricks_url/api/2.0/clusters/list \
| jq '.clusters[] | select(.cluster_name=="Cluster")' | jq -r .cluster_id)

echo $cluster_id

jq -n --arg existing_cluster_id $cluster_id '{ "run_name": "Run mount-dir", "existing_cluster_id": $existing_cluster_id, "notebook_task": { "notebook_path": "/Shared/mount-dir" } }' > "$databricks_path/run-job.json"

cat "$databricks_path/run-job.json"

curl -X POST \
-H "Authorization: Bearer $access_token" \
$databricks_url/api/2.0/jobs/runs/submit \
--data @"$databricks_path/run-job.json"

curl -X GET \
-H "Authorization: Bearer $access_token" \
$databricks_url/api/2.0/jobs/runs/list
```
