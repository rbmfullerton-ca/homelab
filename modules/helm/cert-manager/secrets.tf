resource "kubernetes_secret_v1" "secret" {
  metadata {
    name      = "cloudflare-token-secret"
    namespace = var.namespace
  }

  type = "Opaque"

  data = {
    cloudflare-token = var.cloudflare-token
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["field.cattle.io/projectId"],
    ]
  }
}