resource "kubernetes_secret_v1" "atlantis_terraform_secrets" {
  metadata {
    name      = "atlantis-terraform-vars"
    namespace = var.namespace
  }

  # Map your secrets to TF_VAR_ names so Terraform sees them automatically
  data = {
    "TF_VAR_authentik_token"  = var.authentik_token
    "TF_VAR_cloudflare_token" = var.cloudflare_token
  }

  type = "Opaque"
}