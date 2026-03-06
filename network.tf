resource "kubernetes_network_policy_v1" "allow_servarr_internet_and_dns_jackett_egress_only" {
  metadata {
    name      = "allow-internet-and-dns-jackett-egress-only"
    namespace = "servarr"
  }

  spec {
    pod_selector {}

    policy_types = ["Egress"]

    # Allow internet egress except private ranges
    egress {
      to {
        ip_block {
          cidr = "0.0.0.0/0"

          except = [
            "10.0.0.0/8",
            "172.16.0.0/12",
            "192.168.0.0/16"
          ]
        }
      }
    }

    # Allow DNS + port 9117 egress anywhere
    egress {
      ports {
        protocol = "UDP"
        port     = 53
      }

      ports {
        protocol = "TCP"
        port     = 53
      }

      ports {
        protocol = "TCP"
        port     = 9117
      }
    }
  }
}

resource "kubernetes_network_policy_v1" "servarr_egress_to_internal" {
  metadata {
    name      = "servarr-egress-to-internal"
    namespace = "servarr"
  }

  spec {
    pod_selector {
      match_expressions {
        key      = "app"
        operator = "In"
        values   = ["sonarr", "radarr"]
      }
    }

    policy_types = ["Egress"]

    egress {
      to {
        ip_block {
          cidr = "192.168.0.33/32"
        }
      }

      ports {
        protocol = "TCP"
        port     = 9091
      }
    }
  }
}

resource "kubernetes_network_policy_v1" "seerr_egress_allow" {
  metadata {
    name      = "seerr-egress-allow"
    namespace = "servarr"
  }

  spec {
    pod_selector {
      match_labels = {
        app = "seerr"
      }
    }

    policy_types = ["Egress"]

    # Allow to Radarr (same namespace)
    egress {
      to {
        pod_selector {
          match_labels = {
            app = "radarr"
          }
        }
      }

      ports {
        protocol = "TCP"
        port     = 7878
      }
    }

    # Allow to Sonarr (same namespace)
    egress {
      to {
        pod_selector {
          match_labels = {
            app = "sonarr"
          }
        }
      }

      ports {
        protocol = "TCP"
        port     = 8989
      }
    }

    # Allow to plex
    egress {
      to {
        ip_block {
          cidr = "172.16.0.35/32"
        }
      }

      ports {
        protocol = "TCP"
        port     = 32400
      }
    }
  }
}
