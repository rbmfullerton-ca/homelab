resource "kubernetes_secret_v1" "traefik_dashboard_auth" {
  metadata {
    name      = "traefik-dashboard-auth"
    namespace = "traefik"
  }

  type = "Opaque"

  data = {
    users = var.traefik-dashboard-auth
  }
}