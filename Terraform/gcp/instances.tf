data google_compute_zones "zones" {}
# Compute
resource google_compute_instance "server" {
  machine_type = "n1-standard-1"
  name         = "tg-${var.environment}-machine"
  zone         = data.google_compute_zones.zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
  can_ip_forward = true

  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
  labels = {
    git_file             = "terraform/gcp/instances.tf"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "tg-${var.environment}-disk"
  labels = {
    git_file             = "terraform/gcp/instances.tf"
  }
}
