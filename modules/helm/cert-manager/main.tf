provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver

  values = [
    yamlencode({
      installCRDs         = false
      replicaCount        = 3
      extraArgs = [
        "--dns01-recursive-nameservers=1.1.1.1:53,9.9.9.9:53",
        "--dns01-recursive-nameservers-only"
      ]
      podDnsPolicy = "None"
      podDnsConfig = {
        nameservers = [
          "1.1.1.1",
          "9.9.9.9"
        ]
      }
    })
  ]
}