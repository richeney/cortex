# Nested subscription template deployments

## Azure CLI

```bash
az deployment create --name cortex --template-file azuredeploy.json --parameters "@azuredeploy.parameters.json"
```

## REST API

REST Call

```text
PUT https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Resources/deployments/{deploymentName}?api-version=2019-08-01
```

Example data:

```json
{
    "location": "westeurope",
    "properties": {
        "mode": "Incremental",
        "parameters": {
            "mprg": {
                "value": "hack1mprg"
            },
            "mpsa": {
                "value": "hack1mpsa"
            }
        },
        "templateLink": {
            "uri": "https://raw.githubusercontent.com/richeney/cortex/master/azuredeploy.json",
            "contentVersion": "1.0.0.0"
        }
    }
}
```

Note that you need the raw path version. Also the parameters could be in a URI as well. The template can also be included. Some partners use Python, Go etc. to construct templates on the fly using source templates, handlebar substitution etc.

Example command using `az rest`:

```bash
deploymentName=myRestBasedDeployment
subscriptionId=$(az account show --query id --output tsv)
uri=https://management.azure.com/subscriptions/$subscriptionId/providers/Microsoft.Resources/deployments/$deploymentName?api-version=2019-08-01
body='{"location":"westeurope","properties":{"mode":"Incremental","parameters":{"mprg":{"value":"hack1mprg"},"mpsa":{"value":"hack1mpsa"}},"templateLink":{"uri":"https://raw.githubusercontent.com/richeney/cortex/master/azuredeploy.json","contentVersion":"1.0.0.0"}}}'

az rest --method put --uri $uri --body "$body"
```