data "digitalocean_kubernetes_versions" "olender" {
  version_prefix = "1.23."
}

resource "digitalocean_kubernetes_cluster" "olender" {
  name   = "olender"
  # 'doctl kubernetes options regions'
  region = "ams3"
  auto_upgrade = true
  version = data.digitalocean_kubernetes_versions.olender.latest_version

  maintenance_policy {
    start_time  = "04:00"
    day         = "sunday"
  }

  node_pool {
    name       = "worker-pool"
    # 'doctl kubernetes options sizes'
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 2
    max_nodes  = 3
  }
}

