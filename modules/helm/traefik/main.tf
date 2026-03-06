provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "deployment" {
  name       = var.app_name
  namespace  = var.namespace
  repository = var.repo
  chart      = var.chart
  version    = var.ver

  values = [
    yamlencode({
      additionalArguments = [
        "--global.sendanonymoususage=false",
        "--global.checknewversion=false",
        "--serversTransport.insecureSkipVerify=true",
        "--log.level=INFO",
        "--entrypoints.web.http.redirections.entrypoint.to=websecure",
        "--entrypoints.web.http.redirections.entrypoint.scheme=https",
        "--entrypoints.web.http.redirections.entrypoint.permanent=true"
      ]

      deployment = {
        enabled       = true
        replicas      = 2
        annotations   = {}
        podAnnotations = {}
        additionalContainers = []
        initContainers = []
      }

      nodeSelector = {
        worker = "true"
      }

      ports = {
        web = {
          port        = 80
          exposedPort = 80
          protocol    = "TCP"
        }
        websecure = {
          port        = 443
          exposedPort = 443
          protocol    = "TCP"
        }
      }

      ingressRoute = {
        dashboard = {
          enabled = false
        }
      }

      providers = {
        kubernetesCRD = {
          enabled                  = true
          ingressClass             = "traefik-external"
          allowExternalNameServices = true
          allowCrossNamespace       = true
        }
        kubernetesIngress = {
          enabled                  = true
          allowExternalNameServices = true
          publishedService         = {
            enabled = false
          }
        }
      }

      rbac = {
        enabled = true
      }

      service = {
        enabled             = true
        type                = "LoadBalancer"
        annotations         = {}
        labels              = {}
        spec = {
          loadBalancerIP = "192.168.0.122"
        }
        loadBalancerSourceRanges = []
        externalIPs = []
      }
    })
  ]
}