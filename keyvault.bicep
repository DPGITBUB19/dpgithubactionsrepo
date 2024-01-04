@description('Specifies the location for resources.')
param location string = 'East US'
param tenantId string = '6e536707-66c3-48a5-877d-3191d94f9482'
param objectId string = '204b60a5-2312-4bfe-9605-cd5c3be75a1c'
param name string = 't79d-ace-kv-003'
param sku string = 'standard'

module keyVaultModule './modules/vault.bicep' = {
  name: 'KeyVaultModuleDeployment'
  params: {
    keyVaultName: name
    location: location 
    skuName: sku
    tenantId: tenantId    
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: objectId
        permissions: {
          keys: ['get', 'list']
          secrets: ['get']
        }
      }
    ]
  }
}

output keyVaultResourceId string = keyVaultModule.outputs.keyVaultResourceId
output keyVaultName string = keyVaultModule.outputs.keyVaultName
