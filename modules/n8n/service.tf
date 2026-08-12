resource "kubernetes_service_account_v1" "n8n_automation" {
  metadata {
    name      = "n8n-automation-sa"
    namespace = "n8n"
  }
}

resource "kubernetes_cluster_role_v1" "n8n_cluster_reader_role" {
  metadata {
    name = "n8n-cluster-global-reader"
  }

  # Allows getting and listing secrets, pods, and services cluster-wide
  rule {
    api_groups     = [""]
    resources      = ["secrets", "pods", "services"]
    verbs          = ["get", "list"]
  }

  rule {
    api_groups     = ["apps"]
    resources      = ["deployments", "statefulsets"]
    verbs          = ["get", "list"]
  }
}

resource "kubernetes_cluster_role_binding_v1" "n8n_cluster_reader_binding" {
  metadata {
    name = "n8n-cluster-global-reader-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role_v1.n8n_cluster_reader_role.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account_v1.n8n_automation.metadata[0].name
    namespace = "n8n"
  }
}

resource "kubernetes_secret_v1" "n8n_automation_token" {
  metadata {
    name      = "n8n-automation-token"
    namespace = "n8n"
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account_v1.n8n_automation.metadata[0].name
    }
  }

  type                           = "kubernetes.io/service-account-token"
  wait_for_service_account_token = true
}

output "n8n_bearer_token" {
  value     = kubernetes_secret_v1.n8n_automation_token.data["token"]
  sensitive = true
}