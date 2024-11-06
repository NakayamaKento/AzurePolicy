param timeInterval string
param workspaceRegion string
param networkWatcherRG string
param networkWatcherName string
param flowlogName string
param location string
param targetResource string
param retentionDays string
param workspacename string
param workspaceResorceGroup string


module flowlogDeployment_flowlog 'nested_flowlogDeployment_flowlog.bicep' = {
  name: 'flowlogDeployment-${uniqueString(flowlogName)}'
  scope: resourceGroup(networkWatcherRG)
  params: {
    networkWatcherName: networkWatcherName
    flowlogName: flowlogName
    location: location
    targetResource: targetResource
    workspaceRegion: workspaceRegion
    workspacename:workspacename
    workspaceResorceGroup: workspaceResorceGroup
    timeInterval: timeInterval
    retentionDays: retentionDays
    networkWatcherRG: networkWatcherRG
  }
}
