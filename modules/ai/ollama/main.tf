resource "kubernetes_persistent_volume_v1" "ollama_local_pv" {
  metadata {
    name      = "ollama-local-pv"
  }
  spec {
    capacity = {
      storage = "20Gi"
    }
    access_modes   = ["ReadWriteOnce"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "local-storage"

    persistent_volume_source {
      host_path {
        path = "/mnt/ollama-data"
        type = "DirectoryOrCreate"
      }
    }

    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["k3s-worker-01"]
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "ollama_pvc" {
  metadata {
    name      = "ollama-pvc"
    namespace = "ai"
  }
  spec {
    access_modes   = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "20Gi"
      }
    }
    storage_class_name = "local-storage"
    volume_name = "ollama-local-pv"
  }
}

resource "kubernetes_deployment_v1" "ollama" {
  metadata {
    name      = "ollama"
    namespace = "ai"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "ollama"
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
          app = "ollama"
        }
      }
      spec {
        runtime_class_name = "nvidia"
        node_selector = {
          gpu = "true"
        }
        container {
          name             = "ollama"
          image            = "ollama/ollama:0.17.6"
          port {
            container_port = 11434
          }
          resources {
            limits = {
              "nvidia.com/gpu" = 1
            }
          }

          volume_mount {
            name      = "ollama-data"
            mount_path = "/root/.ollama"
          }
        }

        volume {
          name = "ollama-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.ollama_pvc.metadata.0.name
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "ollama" {
  metadata {
    name      = "ollama"
    namespace = "ai"
  }
  spec {
    selector = {
      app = "ollama"
    }
    port {
      port        = 11434
      target_port = 11434
    }
    type = "ClusterIP"
  }
}
