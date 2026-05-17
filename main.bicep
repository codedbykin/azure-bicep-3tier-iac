param location string = 'norwayeast'
param appName string = 'app-p08-${uniqueString(resourceGroup().id)}'

module vnet 'modules/vnet.bicep' = {
  name: 'vnetDeployment'
  params: {
    location: location
  }
}

module appService 'modules/appservice.bicep' = {
  name: 'appServiceDeployment'
  params: {
    location: location
    appName: appName
  }
}

output appUrl string = appService.outputs.appUrl
output vnetName string = vnet.outputs.vnetName
