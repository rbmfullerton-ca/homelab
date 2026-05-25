# Helm release
resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver
  timeout    = 900
  wait       = true
}

resource "kubernetes_manifest" "ip_pool" {
  field_manager {
    force_conflicts = true
  }
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "IPAddressPool"
    metadata = {
      name      = "first-pool"
      namespace = "metallb-system"
    }
    spec = {
      addresses = ["192.168.0.120-192.168.0.160"]
      autoAssign = true
    }
  }
  depends_on = [helm_release.deployment]
}

resource "kubernetes_manifest" "l2_advertisement" {
  field_manager { force_conflicts = true }
  manifest = {
    apiVersion = "metallb.io/v1beta1"
    kind       = "L2Advertisement"
    metadata = {
      name      = "example"
      namespace = "metallb-system"
    }
    spec = {
      ipAddressPools = ["first-pool"]
    }
  }
  depends_on = [helm_release.deployment]
}
