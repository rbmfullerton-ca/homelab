# Helm release
resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver
  timeout    = 1800
  wait       = true

  create_namespace = false

  set = [
    {
    name = "defaultSettings.priorityClass"
    value = "longhorn-critical"
  },
  {
    name  = "defaultSettings.systemManagedComponentsNodeSelector"
    value = "longhorn:true"
  },
  {
    name  = "persistence.defaultClass"
    value = "true"
  },
  {
    name  = "persistence.defaultClassReplicaCount"
    value = "3"
  },
  {
    name  = "persistence.reclaimPolicy"
    value = "Delete"
  }
  ]
}
