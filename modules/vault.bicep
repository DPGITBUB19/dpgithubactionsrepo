param keyVaultName string
param location string
param skuName string
param tenantId string
param accessPolicies array

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview'= {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: skuName
    }
    tenantId: tenantId
    accessPolicies: accessPolicies  
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
  }
}
output keyVaultResourceId string = keyVault.id
output keyVaultName string = keyVault.name
