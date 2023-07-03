# Azure-Fleet-Manager
Azure Kubernetes Fleet Manager in Terraform deployed with Prometheus
<br><b> This repository houses the uses of Azure Kubernetes Fleet Manager (Preview) that requires some pre-requisites</b></br>

<br><b>Reference Architecture</b></br>
<img src='https://github.com/sn0rlaxlife/azure-fleet-manager/blob/main/Screenshot%202023-07-03%20143214.png'></img>

<br><p>For the uses of this repository ensure you have registered for this preview via the following commands</p></br>
<p>Ensure you have the Azure CLI to use the following command either locally/on Cloud Shell</p>
<br><p>az extension add --name fleet</p></br>
<br> Permissions needed are the following</br>
<p>Microsoft.ContainerService/fleets/read
Microsoft.ContainerService/fleets/write
Microsoft.ContainerService/fleets/listCredentials/action
Microsoft.ContainerService/fleets/members/read
Microsoft.ContainerService/fleets/members/write
Microsoft.ContainerService/fleetMemberships/read
Microsoft.ContainerService/fleetMemberships/write
Microsoft.ContainerService/managedClusters/read
Microsoft.ContainerService/managedClusters/write
Microsoft.ContainerService/managedClusters/listClusterUserCredential/action</p>
