#PVC
resource "kubernetes_persistent_volume_claim_v1" "pvclaim" {
  metadata {
    name      = "${var.app_name}-claim"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.storage_size
      }
    }
    storage_class_name = var.storage_class
  }
}

# Deployment
resource "kubernetes_deployment_v1" "deployment" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = var.app_name
      }
    }
    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_unavailable = "1"  # Allows one pod to be unavailable during the update
        max_surge       = "0"  # Ensures no new pods are created until the old pod is removed
      }
    }
    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }
      spec {
        node_selector = {
          worker = "true"
        }
        container {
          image           = "${var.image}:${var.image_version}"
          image_pull_policy = "IfNotPresent"
          name            = var.app_name
          port {
            container_port  = var.port
            name              = "ui80"
            protocol          = var.protocol
          }
          port {
            container_port  = var.port2
            name              = "ui443"
            protocol          = var.protocol
          }
          volume_mount {
              mount_path = var.mount_path
              name       = "${var.app_name}-data"
          }
          volume_mount {
              mount_path = var.mount_path2
              name       = "${var.app_name}-data"
          }
          volume_mount {
              mount_path = var.mount_path3
              name       = "${var.app_name}-data"
          }
          volume_mount {
              mount_path = var.mount_path4
              name       = "${var.app_name}-data"
          }
          dynamic "env" {
            for_each = var.envs
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
        }
        volume {
          name = "${var.app_name}-data"
          persistent_volume_claim {
            claim_name = "${var.app_name}-claim"
          }
        }
      }
    }
  }
}

# Service
resource "kubernetes_service_v1" "service" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
  }
  spec {
    port {
      name       = "ui"
      port       = var.port
      protocol   = var.protocol
      target_port = var.port
    }
    selector = {
      app = var.app_name
    }
    type = "ClusterIP"
  }
}