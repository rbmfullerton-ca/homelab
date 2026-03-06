resource "kubernetes_persistent_volume_v1" "comfyui_local_pv" {
  metadata {
    name = "comfyui-local-pv"
  }
  spec {
    capacity = {
      storage = "15Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name = "local-storage"
    persistent_volume_source {
      host_path {
        path = "/mnt/comfyui-data"
        type = "DirectoryOrCreate"
      }
    }
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key = "kubernetes.io/hostname"
            operator = "In"
            values = ["k3s-worker-02"]
          }
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "comfyui_pvc" {
  metadata {
    name = "comfyui-pvc"
    namespace = "ai"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "15Gi"
      }
    }
    storage_class_name = "local-storage"
    volume_name = "comfyui-local-pv"
  }
}

resource "kubernetes_deployment_v1" "comfyui-nvidia" {
  metadata {
    name = "comfyui-nvidia"
    namespace = "ai"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "comfyui-nvidia"
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
          app = "comfyui-nvidia"
        }
      }
      spec {
        runtime_class_name = "nvidia"
        node_selector = {
          gpu = "true"
        }
        container {
          name = "comfyui-nvidia"
          image = "mmartial/comfyui-nvidia-docker:ubuntu24_cuda12.6.3-20251228"
          port {
            container_port = 8188
          }
          resources {
            limits = {
              "nvidia.com/gpu" = 1
            }
          }
          volume_mount {
            name = "comfyui-data"
            mount_path = "/basedir"
          }
          volume_mount {
            name = "comfyui-data"
            mount_path = "/comfy/mnt"
          }

          env {
            name = "WANTED_UID"
            value = "0"
          }
          env {
            name = "WANTED_GID"
            value = "0"
          }
          env {
            name = "BASE_DIRECTORY"
            value = "/basedir"
          }
          env {
            name = "SECURITY_LEVEL"
            value = "normal"
          }
          env {
            name = "NVIDIA_VISIBLE_DEVICES"
            value = "all"
          }
          env {
            name = "NVIDIA_DRIVER_CAPABILITIES"
            value = "all"
          }
        }
        volume {
          name = "comfyui-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim_v1.comfyui_pvc.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_service_v1" "comfyui-nvidia" {
  metadata {
    name = "comfyui-nvidia"
    namespace = "ai"
  }
  spec {
    selector = {
      app = "comfyui-nvidia"
    }
    port {
      port = 8188
      target_port = 8188
    }
    type = "ClusterIP"
  }
}
