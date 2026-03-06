#servarr
resource "kubernetes_persistent_volume_v1" "smb-tvshows" {
  metadata {
    name = "smb-tvshows"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-tvshows"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-tvshows"

        volume_attributes = {
          source = "//10.0.0.45/TVShows"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "smb-tvshows" {
  metadata {
    name      = "smb-tvshows"
    namespace = "servarr"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-tvshows"
    storage_class_name = "smb-tvshows"
  }
}

resource "kubernetes_persistent_volume_v1" "smb-movies" {
  metadata {
    name = "smb-movies"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-movies"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-movies"

        volume_attributes = {
          source = "//10.0.0.45/Movies"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "smb-movies" {
  metadata {
    name      = "smb-movies"
    namespace = "servarr"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-movies"
    storage_class_name = "smb-movies"
  }
}


resource "kubernetes_persistent_volume_v1" "smb-downloads" {
  metadata {
    name = "smb-downloads"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-downloads"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-downloads"

        volume_attributes = {
          source = "//10.0.0.45/Downloads"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "smb-downloads" {
  metadata {
    name      = "smb-downloads"
    namespace = "servarr"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-downloads"
    storage_class_name = "smb-downloads"
  }
}






#servarr-internal

resource "kubernetes_persistent_volume_v1" "smb-tvshows-internal" {
  metadata {
    name = "smb-tvshows-internal"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-tvshows"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-tvshows-internal"

        volume_attributes = {
          source = "//10.0.0.45/TVShows"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "smb-tvshows-internal" {
  metadata {
    name      = "smb-tvshows-internal"
    namespace = "servarr-internal"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-tvshows-internal"
    storage_class_name = "smb-tvshows"
  }
}

resource "kubernetes_persistent_volume_v1" "smb-movies-internal" {
  metadata {
    name = "smb-movies-internal"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-movies"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-movies-internal"

        volume_attributes = {
          source = "//10.0.0.45/Movies"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "smb-movies-internal" {
  metadata {
    name      = "smb-movies-internal"
    namespace = "servarr-internal"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-movies-internal"
    storage_class_name = "smb-movies"
  }
}

resource "kubernetes_persistent_volume_v1" "smb-books-internal" {
  metadata {
    name = "smb-books-internal"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-books"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-books-internal"

        volume_attributes = {
          source = "//10.0.0.45/Books"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "smb-books-internal" {
  metadata {
    name      = "smb-books-internal"
    namespace = "servarr-internal"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-books-internal"
    storage_class_name = "smb-books"
  }
}

resource "kubernetes_persistent_volume_v1" "smb-downloads-internal" {
  metadata {
    name = "smb-downloads-internal"

    annotations = {
      "pv.kubernetes.io/provisioned-by" = "smb.csi.k8s.io"
    }
  }

  spec {
    capacity = {
      storage = "100Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "smb-downloads"

    mount_options = [
      "dir_mode=0777",
      "file_mode=0777",
    ]

    persistent_volume_source {
      csi {
        driver        = "smb.csi.k8s.io"
        read_only     = false
        volume_handle = "smb-downloads-internal"

        volume_attributes = {
          source = "//10.0.0.45/Downloads"
        }

        node_stage_secret_ref {
          name      = "smbcreds"
          namespace = "servarr"
        }
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim_v1" "smb-downloads-internal" {
  metadata {
    name      = "smb-downloads-internal"
    namespace = "servarr-internal"
  }

  spec {
    access_modes = ["ReadWriteMany"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    volume_name        = "smb-downloads-internal"
    storage_class_name = "smb-downloads"
  }
}
