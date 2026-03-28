# Helm release
resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  create_namespace = false
  repository = var.repo
  chart      = var.chart
  version    = var.ver

  values = [
    yamlencode({
      defaultSettings = {
        priorityClass = "longhorn-critical"
        systemManagedComponentsNodeSelector = "longhorn:true"
      }
      persistence = {
        defaultClass = true
        defaultClassReplicaCount = 3
	reclaimPolicy            = "Delete"
      }
    })
  ]
}
