# Define the Kubernetes runtime class with kubernetes_runtime_class_v1 resource
resource "kubernetes_runtime_class_v1" "nvidia" {
  metadata {
    name = "nvidia"
  }
  handler = "nvidia"

  lifecycle {
    ignore_changes = [
      metadata[0].annotations,
      metadata[0].labels,
    ]
  }
}