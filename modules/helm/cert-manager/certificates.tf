module "cert_traefik" {
  source      = "./modules/certificates"
  cert_name   = "hozzlab"
  namespace   = "traefik"
  secret_name = "hozzlab-tls"
  common_name = "*.hozzlab.ca"
  dns_names   = ["*.hozzlab.ca", "hozzlab.ca"]
}

module "cert_authentik" {
  source      = "./modules/certificates"
  cert_name   = "hozzlab"
  namespace   = "authentik"
  secret_name = "authentik-outpost-tls"
  common_name = "*.hozzlab.ca"
  dns_names   = ["*.hozzlab.ca", "hozzlab.ca"]
}

module "cert_rancher" {
  source      = "./modules/certificates"
  cert_name   = "hozzlab"
  namespace   = "cattle-system"
  secret_name = "tls-rancher-ingress"
  common_name = "*.hozzlab.ca"
  dns_names   = ["*.hozzlab.ca", "hozzlab.ca"]
}

module "cert_n8n" {
  source      = "./modules/certificates"
  cert_name   = "hozzlab"
  namespace   = "n8n"
  secret_name = "hozzlab-wildcard"
  common_name = "*.hozzlab.ca"
  dns_names   = ["*.hozzlab.ca", "hozzlab.ca"]
}

module "cert_n8n_standard" {
  source      = "./modules/certificates"
  cert_name   = "n8n"
  namespace   = "n8n"
  secret_name = "hozzlab-tls"
  common_name = "n8n.hozzlab.ca"
  dns_names   = ["n8n.hozzlab.ca"]
}


#module "cert_test" {
#  source      = "./modules/certificates"
#  cert_name   = "hozzlab-test"
#  namespace   = "servarr"
#  secret_name = "tls-test"
#  common_name = "*.hozzlab.ca"
#  dns_names   = ["*.hozzlab.ca", "hozzlab.ca"]
#}