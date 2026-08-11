terraform {
  required_providers {
    pihole = {
      source  = "ryanwholey/pihole"
      version = "2.0.0-beta.1"
      configuration_aliases = [pihole.pihole1, pihole.pihole2, pihole.pihole3]
    }
  }
}

# Do modules here
module uptimekuma {
  source = "./modules/local_dns"
  domain = "${var.app_name_uptimekuma}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module pihole {
  source = "./modules/local_dns"
  domain = "${var.app_name_pihole}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module pihole2 {
  source = "./modules/local_dns"
  domain = "${var.app_name_pihole2}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module homarr {
  source = "./modules/local_dns"
  domain = "${var.app_name_homarr}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module jackett {
  source = "./modules/local_dns"
  domain = "${var.app_name_jackett}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}


module openwebui {
  source = "./modules/local_dns"
  domain = "${var.app_name_openwebui}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module comfyui {
  source = "./modules/local_dns"
  domain = "${var.app_name_comfyui}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module pterodactyl_panel {
  source = "./modules/local_dns"
  domain = "${var.app_name_pterodactyl_panel}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module bazarr {
  source = "./modules/local_dns"
  domain = "${var.app_name_bazarr}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module bookshelf {
  source = "./modules/local_dns"
  domain = "${var.app_name_bookshelf}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module request {
  source = "./modules/local_dns"
  domain = "${var.app_name_request}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module traefik {
  source = "./modules/local_dns"
  domain = "${var.app_name_traefik}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module sonarr {
  source = "./modules/local_dns"
  domain = "${var.app_name_sonarr}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module radarr {
  source = "./modules/local_dns"
  domain = "${var.app_name_radarr}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module seerr {
  source = "./modules/local_dns"
  domain = "${var.app_name_seerr}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module authentik {
  source = "./modules/local_dns"
  domain = "${var.app_name_authentik}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module rancher {
  source = "./modules/local_dns"
  domain = "${var.app_name_rancher}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module atlantis {
  source = "./modules/local_dns"
  domain = "${var.app_name_atlantis}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

module n8n {
  source = "./modules/local_dns"
  domain = "${var.app_name_n8n}.hozzlab.ca"
  ip = "192.168.0.122"
  providers = {
    pihole.pihole1 = pihole.pihole1
    pihole.pihole2 = pihole.pihole2
    pihole.pihole3 = pihole.pihole3
  }
}

