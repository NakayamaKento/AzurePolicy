param networkWatcherName string
param flowlogName string
param location string
param targetResource string
param workspaceRegion string
param timeInterval string
param retentionDays string
param workspacename string
param workspaceResorceGroup string
param networkWatcherRG string

var fullWorkspaceResourceGroup = '${subscription().id}/resourceGroups/${workspaceResorceGroup}'
//var networkFlowLogName = '${subscription().id}/resourceGroups/${networkWatcherRG}/providers/Microsoft.Network/networkWatchers/${networkWatcherName}/flowLogs/${flowlogName}'

resource networkWatcherName_flowlog 'Microsoft.Network/networkWatchers/flowLogs@2022-09-01' = {
  name: '${networkWatcherName}/${flowlogName}'
  location: location
  properties: {
    targetResourceId: targetResource
    storageId: storageAccount.id
    enabled: 'true'
    flowAnalyticsConfiguration: {
      networkWatcherFlowAnalyticsConfiguration: {
        enabled: true
        workspaceRegion: workspaceRegion
        workspaceResourceId: logAnalyticsWorkspace.id
        trafficAnalyticsInterval: timeInterval
      }
    }
    retentionPolicy: {
      days: retentionDays
      enabled: 'true'
    }
    format: {
      type: 'JSON'
      version: 2
    }
  }
}

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2023-09-01' existing = {
  name: workspacename
  scope: resourceGroup(workspaceResorceGroup)
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' existing = {
  name: 'storage${uniqueString(fullWorkspaceResourceGroup)}'
  scope: resourceGroup(workspaceResorceGroup)
}
