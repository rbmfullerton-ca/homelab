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
    labels = {
      app                        = var.app_name
      appsplit                   = var.app_split
      "app.kubernetes.io/instance" = var.app_name
    }
  }
  lifecycle {
    ignore_changes = [
      # ignore for Rancher Deployment annotations
      metadata[0].annotations["field.cattle.io/publicEndpoints"],
      spec[0].template[0].metadata[0].annotations["field.cattle.io/publicEndpoints"],
    ]
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

        affinity {
          pod_anti_affinity {
            required_during_scheduling_ignored_during_execution {
              topology_key = "kubernetes.io/hostname"

              label_selector {
                match_labels = {
                  appsplit = var.app_split
                }
              }

              namespace_selector {}
            }
          }
        }

        container {
          image           = "${var.image2}:${var.image_version2}"
          image_pull_policy = "IfNotPresent"
          name            = var.app_name2
          dynamic "env" {
            for_each = var.envs2
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
        }

        container {
          image           = "${var.image}:${var.image_version}"
          image_pull_policy = "IfNotPresent"
          name            = var.app_name
          port {
            container_port  = var.port
            name              = "ui"
            protocol          = var.protocol
          }
          port {
            container_port  = var.port2
            name              = "dns"
            protocol          = var.protocol
          }
          port {
            container_port  = var.port3
            name              = "dns-udp"
            protocol          = "UDP"
          }
          port {
            container_port  = var.port4
            name              = "pihole-ssl"
            protocol          = var.protocol
          }
          port {
            container_port  = var.port5
            name              = "client-udp"
            protocol          = "UDP"
          }

          volume_mount {
              mount_path = var.mount_path
              name       = "${var.app_name}-data"
          }
          dynamic "env" {
            for_each = var.envs
            content {
              name  = env.value.name
              value = env.value.value
            }
          }
          security_context {
            capabilities {
              add = ["NET_ADMIN"]
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
    labels = {
      app = var.app_name
    }
  }
  lifecycle {
    ignore_changes = [
      # ignores for Rancher and LoadBalancer IP managers
      metadata[0].annotations["field.cattle.io/publicEndpoints"],
      metadata[0].annotations["kube-vip.io/loadbalancerIPs"],
      metadata[0].annotations["metallb.universe.tf/ip-allocated-from-pool"],
    ]
  }
  spec {
    port {
      name       = "ui"
      port       = var.port
      protocol   = var.protocol
      target_port = var.port
    }
    port {
      name       = "dns"
      port       = var.port2
      protocol   = var.protocol
      target_port = var.port2
    }
    port {
      name       = "dns-udp"
      port       = var.port3
      protocol   = "UDP"
      target_port = var.port3
    }
    port {
      name       = "pihole-ssl"
      port       = var.port4
      protocol   = var.protocol
      target_port = var.port4
    }
    port {
      name       = "client-udp"
      port       = var.port5
      protocol   = "UDP"
      target_port = var.port5
    }
    selector = {
      app = var.app_name
    }
    type = "LoadBalancer"
    load_balancer_ip         = var.load_balancer_ip
    external_traffic_policy  = "Local"
  }
}