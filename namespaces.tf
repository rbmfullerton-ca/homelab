resource "kubernetes_namespace_v1" "uptimekuma" {
  metadata {
    name = "uptimekuma"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "servarr-internal" {
  metadata {
    name = "servarr-internal"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "ai" {
  metadata {
    name = "ai"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "pterodactyl" {
  metadata {
    name = "pterodactyl"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "cronjobs" {
  metadata {
    name = "cronjobs"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "pihole" {
  metadata {
    name = "pihole"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "pihole2" {
  metadata {
    name = "pihole2"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "servarr" {
  metadata {
    name = "servarr"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "authentik" {
  metadata {
    name = "authentik"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "traefik" {
  metadata {
    name = "traefik"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "cert-manager" {
  metadata {
    name = "cert-manager"
  }
  lifecycle {
    ignore_changes = [
      # Ignore rancher annotations
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
      metadata[0].annotations["field.cattle.io/projectId"],
      metadata[0].annotations["management.cattle.io/no-default-sa-token"],
      # Ignore Rancher labels
      metadata[0].labels["field.cattle.io/projectId"],
    ]
  }
}

resource "kubernetes_namespace_v1" "atlantis" {
  metadata {
    name = "atlantis"
  }
  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}

resource "kubernetes_namespace_v1" "longhorn-system" {
  metadata {
    name = "longhorn-system"
    labels = {
      "app.kubernetes.io/managed-by" = "Helm"
    }
    annotations = {
      "meta.helm.sh/release-name"      = "longhorn"
      "meta.helm.sh/release-namespace" = "longhorn-system"
    }
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cattle.io/status"],
      metadata[0].annotations["lifecycle.cattle.io/create.namespace-auth"],
    ]
  }
}