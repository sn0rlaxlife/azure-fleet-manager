# helm install -n prometheus prometheus prometheus-community/kube-prometheus-stack

resource "helm_release" "prometheus" {
  chart            = "kube-prometheus-stack"
  namespace        = "prometheus"
  create_namespace = "true"
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
}

# Compare this snippet from fleetmember.tf:
# #creates a fleet member resource reference https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_fleet_member
