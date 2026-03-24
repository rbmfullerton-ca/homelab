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
    name  = "annotations.secret\\.reloader\\.stakater\\.com/reload"
    value = "atlantis-terraform-vars"
  },
  {
    name = "environment.ATLANTIS_GH_ORG"
    value = "rbmfullerton-ca"
  },
  {
    name = "environment.ATLANTIS_EMOJI_REACTION"
    value = "rocket"
  },
  {
    name = "environment.ATLANTIS_GH_TEAM_ALLOWLIST"
    value = "admins:plan\\, admins:apply\\, admins:state\\, admins:import\\, admins:unlock\\, admins:approve_policies"
  },
  {
    name = "orgAllowlist"
    value = "github.com/rbmfullerton-ca/homelab"
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
    name  = "environment.ATLANTIS_GH_INSTALLATION_ID"
    value = "118116825"
  },
  {
    name = "volumeClaim.storageClassName"
    value = var.storageClass
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
  {
    name  = "environmentSecrets[12].name"
    value = "TF_VAR_homarr_envs"
  },
  {
    name  = "environmentSecrets[12].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[12].secretKeyRef.key"
    value = "TF_VAR_homarr_envs"
  },
  {
    name  = "environmentSecrets[13].name"
    value = "TF_VAR_jackett_envs"
  },
  {
    name  = "environmentSecrets[13].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[13].secretKeyRef.key"
    value = "TF_VAR_jackett_envs"
  },
  {
    name  = "environmentSecrets[14].name"
    value = "TF_VAR_openwebui_envs"
  },
  {
    name  = "environmentSecrets[14].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[14].secretKeyRef.key"
    value = "TF_VAR_openwebui_envs"
  },
  {
    name  = "environmentSecrets[15].name"
    value = "TF_VAR_pterodactyl_panel_envs"
  },
  {
    name  = "environmentSecrets[15].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[15].secretKeyRef.key"
    value = "TF_VAR_pterodactyl_panel_envs"
  },
  {
    name  = "environmentSecrets[16].name"
    value = "TF_VAR_pterodactyl_database_envs"
  },
  {
    name  = "environmentSecrets[16].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[16].secretKeyRef.key"
    value = "TF_VAR_pterodactyl_database_envs"
  },
  {
    name  = "environmentSecrets[17].name"
    value = "TF_VAR_bazarr_envs"
  },
  {
    name  = "environmentSecrets[17].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[17].secretKeyRef.key"
    value = "TF_VAR_bazarr_envs"
  },
  {
    name  = "environmentSecrets[18].name"
    value = "TF_VAR_pihole_envs"
  },
  {
    name  = "environmentSecrets[18].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[18].secretKeyRef.key"
    value = "TF_VAR_pihole_envs"
  },
  {
    name  = "environmentSecrets[19].name"
    value = "TF_VAR_pihole_envs2"
  },
  {
    name  = "environmentSecrets[19].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[19].secretKeyRef.key"
    value = "TF_VAR_pihole_envs2"
  },
  {
    name  = "environmentSecrets[20].name"
    value = "TF_VAR_pihole2_envs"
  },
  {
    name  = "environmentSecrets[20].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[20].secretKeyRef.key"
    value = "TF_VAR_pihole2_envs"
  },
  {
    name  = "environmentSecrets[21].name"
    value = "TF_VAR_pihole2_envs2"
  },
  {
    name  = "environmentSecrets[21].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[21].secretKeyRef.key"
    value = "TF_VAR_pihole2_envs2"
  },
  {
    name  = "environmentSecrets[22].name"
    value = "TF_VAR_seerr_envs"
  },
  {
    name  = "environmentSecrets[22].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[22].secretKeyRef.key"
    value = "TF_VAR_seerr_envs"
  },
  {
    name  = "environmentSecrets[23].name"
    value = "TF_VAR_sonarr_envs"
  },
  {
    name  = "environmentSecrets[23].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[23].secretKeyRef.key"
    value = "TF_VAR_sonarr_envs"
  },
  {
    name  = "environmentSecrets[24].name"
    value = "TF_VAR_radarr_envs"
  },
  {
    name  = "environmentSecrets[24].secretKeyRef.name"
    value = kubernetes_secret_v1.atlantis_terraform_secrets.metadata[0].name
  },
  {
    name  = "environmentSecrets[24].secretKeyRef.key"
    value = "TF_VAR_radarr_envs"
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
