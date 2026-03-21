provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

data "kubernetes_secret_v1" "atlantis_gh_key" {
  metadata {
    name      = "atlantis-github-app-key"
    namespace = var.namespace
  }
}

# Helm release resource for deploying atlantis
resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver

  set = [
    {
    name = "extraArgs[0]"
    value = "--automerge"
  },
  {
    name = "environment.ATLANTIS_GH_ORG"
    value = "rbmfullerton"
  },
  {
    name = "environment.ATLANTIS_EMOJI_REACTION"
    value = "rocket"
  },
  {
    name = "atlantisUrl"
    value = "https://atlantis.hozzlab.ca"
  },
  {
    name = "githubApp.id"
    value = var.githubAppID
    type = "string"
  },
  {
    name = "volumeClaim.storageClassName"
    value = var.storageClass
  },
  {
    name = "orgAllowlist"
    value = "github.com/rbmfullerton/homelab"
  },
  {
    name  = "environmentSecrets[0].name"
    value = "TF_VAR_authentik_token"
  },
  {
    name  = "environmentSecrets[0].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[0].secretKeyRef.key"
    value = "TF_VAR_authentik_token"
  },
  {
    name  = "environmentSecrets[1].name"
    value = "TF_VAR_cloudflare_token"
  },
  {
    name  = "environmentSecrets[1].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[1].secretKeyRef.key"
    value = "TF_VAR_cloudflare_token"
  }
  ]

  set_sensitive = [{
    name = "githubApp.key"
    value = data.kubernetes_secret_v1.atlantis_gh_key.data["atlantis-key.pem"]
  },
  {
    name = "githubApp.secret"
    value = var.githubAppSecret
  },
  ]

  create_namespace = false
}
