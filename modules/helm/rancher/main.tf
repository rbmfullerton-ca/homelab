# Helm release
resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver
  timeout    = 1800
  wait       = true

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
    },
    {
      name  = "ingress.ingressClassName"
      value = "traefik"
    },
    {
      name  = "service.type"
      value = "ClusterIP"
    },
    {
      name  = "startupProbe.failureThreshold"
      value = "60"
    },
    {
      name  = "startupProbe.periodSeconds"
      value = "10"
    }
  ]
}
