# Helm release
resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver

  set = [
    {
      name  = "hostname"
      value = "rancher.hozzlab.ca"
    },
    {
      name  = "ingress.tls.source"
      value = "secret"
    },
    {
      name  = "ingress.tls.secretName"
      value = "tls-rancher-ingress"
    }
  ]
}
