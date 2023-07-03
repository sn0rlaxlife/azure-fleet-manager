#creates a fleet manager resource reference https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_fleet_manager

resource "azurerm_kubernetes_fleet_manager" "fleet-east" {
    location           = azurerm_resource_group.fleet.location
    resource_group_name = azurerm_resource_group.fleet.name
    name                = "fleet-east"

    hub_profile {
        dns_prefix = "fleet-east"
    }

    timeouts {
        create = "30m"
        update = "30m"
    }

    depends_on = [module.aks]
}