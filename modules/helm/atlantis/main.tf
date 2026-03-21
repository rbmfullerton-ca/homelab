data "kubernetes_secret_v1" "atlantis_gh_key" {
  metadata {
    name      = "atlantis-github-app-key"
    namespace = var.namespace
  }
}

resource "kubernetes_cluster_role_binding_v1" "atlantis-admin" {
  metadata {
    name = "atlantis-cluster-admin"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "atlantis"
    namespace = "atlantis"
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
    value = "TF_VAR_cloudflare-token"
  },
  {
    name  = "environmentSecrets[1].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[1].secretKeyRef.key"
    value = "TF_VAR_cloudflare-token"
  },
  {
    name  = "environmentSecrets[2].name"
    value = "TF_VAR_authentik_host"
  },
  {
    name  = "environmentSecrets[2].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[2].secretKeyRef.key"
    value = "TF_VAR_authentik_host"
  },
  {
    name  = "environmentSecrets[3].name"
    value = "TF_VAR_rancher_api_token"
  },
  {
    name  = "environmentSecrets[3].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[3].secretKeyRef.key"
    value = "TF_VAR_rancher_api_token"
  },
  {
    name  = "environmentSecrets[4].name"
    value = "TF_VAR_pihole1_api_token"
  },
  {
    name  = "environmentSecrets[4].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[4].secretKeyRef.key"
    value = "TF_VAR_pihole1_api_token"
  },
  {
    name  = "environmentSecrets[5].name"
    value = "TF_VAR_pihole2_api_token"
  },
  {
    name  = "environmentSecrets[5].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[5].secretKeyRef.key"
    value = "TF_VAR_pihole2_api_token"
  },
  {
    name  = "environmentSecrets[6].name"
    value = "TF_VAR_pihole3_api_token"
  },
  {
    name  = "environmentSecrets[6].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[6].secretKeyRef.key"
    value = "TF_VAR_pihole3_api_token"
  },
  {
    name  = "environmentSecrets[7].name"
    value = "TF_VAR_sonarr_api_key"
  },
  {
    name  = "environmentSecrets[7].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[7].secretKeyRef.key"
    value = "TF_VAR_sonarr_api_key"
  },
  {
    name  = "environmentSecrets[8].name"
    value = "TF_VAR_authentik_secret_key"
  },
  {
    name  = "environmentSecrets[8].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[8].secretKeyRef.key"
    value = "TF_VAR_authentik_secret_key"
  },
  {
    name  = "environmentSecrets[9].name"
    value = "TF_VAR_authentik_postgresql_password"
  },
  {
    name  = "environmentSecrets[9].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[9].secretKeyRef.key"
    value = "TF_VAR_authentik_postgresql_password"
  },
  {
    name  = "environmentSecrets[10].name"
    value = "TF_VAR_traefik-dashboard-auth"
  },
  {
    name  = "environmentSecrets[10].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[10].secretKeyRef.key"
    value = "TF_VAR_traefik-dashboard-auth"
  },
  {
    name  = "environmentSecrets[11].name"
    value = "TF_VAR_atlantis-githubAppSecret"
  },
  {
    name  = "environmentSecrets[11].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[11].secretKeyRef.key"
    value = "TF_VAR_atlantis-githubAppSecret"
  },
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
