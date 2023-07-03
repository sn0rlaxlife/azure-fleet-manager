//aks file

module "aks" {
  source                            = "Azure/aks/azurerm"
  version                           = "7.1.0"
  resource_group_name               = azurerm_resource_group.fleet.name
  kubernetes_version                = var.kubernetes_version
  orchestrator_version              = var.kubernetes_version
  prefix                            = "fleet-aks"
  network_plugin                    = "azure"
  vnet_subnet_id                    = lookup(module.aks-vnet.vnet_subnets_name_id, "subnet0")
  os_disk_size_gb                   = 50
  sku_tier                          = "Standard" # defaults to Free
  private_cluster_enabled           = false
  rbac_aad                          = var.rbac_aad
  role_based_access_control_enabled = var.role_based_access_control_enabled
  http_application_routing_enabled  = false
  enable_auto_scaling               = true
  enable_host_encryption            = false
  log_analytics_workspace_enabled   = false
  agents_min_count                  = 1
  agents_max_count                  = 3
  agents_count                      = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                   = 100
  agents_pool_name                  = "system"
  agents_availability_zones         = ["1", "2"]
  agents_type                       = "VirtualMachineScaleSets"
  agents_size                       = var.agents_size
  


  agents_labels = {
    "nodepool" : "defaultnodepool"
  }

  agents_tags = {
    "Agent" : "defaultnodepoolagent"
  }

  ingress_application_gateway_enabled = false

  network_policy             = "azure"
  net_profile_dns_service_ip = "10.0.0.10"
  net_profile_service_cidr   = "10.0.0.0/16"

  key_vault_secrets_provider_enabled = true
  secret_rotation_enabled            = true
  secret_rotation_interval           = "3m"

  depends_on = [module.aks-vnet]
}

module "aks-two" {
  source                            = "Azure/aks/azurerm"
  version                           = "7.1.0"
  resource_group_name               = azurerm_resource_group.fleet2.name
  kubernetes_version                = var.kubernetes_version
  orchestrator_version              = var.kubernetes_version
  prefix                            = "fleet2"
  network_plugin                    = "azure"
  vnet_subnet_id                    = lookup(module.aks-vnet.vnet_subnets_name_id, "subnet0")
  os_disk_size_gb                   = 50
  sku_tier                          = "Standard" # defaults to Free
  private_cluster_enabled           = false
  rbac_aad                          = var.rbac_aad
  role_based_access_control_enabled = var.role_based_access_control_enabled
  http_application_routing_enabled  = false
  enable_auto_scaling               = true
  enable_host_encryption            = false
  log_analytics_workspace_enabled   = false
  agents_min_count                  = 1
  agents_max_count                  = 3
  agents_count                      = null # Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes.
  agents_max_pods                   = 100
  agents_pool_name                  = "system"
  agents_availability_zones         = ["1", "2"]
  agents_type                       = "VirtualMachineScaleSets"
  agents_size                       = var.agents_size
  


  agents_labels = {
    "nodepool" : "defaultnodepool"
  }

  agents_tags = {
    "Agent" : "defaultnodepoolagent"
  }

  ingress_application_gateway_enabled = false

  network_policy             = "azure"
  net_profile_dns_service_ip = "10.0.0.10"
  net_profile_service_cidr   = "10.0.0.0/16"

  key_vault_secrets_provider_enabled = true
  secret_rotation_enabled            = true
  secret_rotation_interval           = "3m"

  depends_on = [module.aks-vnet2]
}