// written by igezici 

// creating vpc and subnet 
resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "my_subnet" {
  name          = "my-subnet"
  region        = "europe-west1"
  network       = google_compute_network.vpc_network.self_link
  ip_cidr_range = "10.0.1.0/24"
}

// creating cloud router and NAT gateway 
resource "google_compute_router" "router" {
  name    = "my-router"
  region  = "europe-west1"
  network = google_compute_network.vpc_network.self_link
}
resource "google_compute_router_nat" "nat" {
  name                               = "my-nat"
  router                             = google_compute_router.router.name
  region                             = "europe-west1"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

// creating instance template 
resource "google_compute_instance_template" "my_template" {
  name         = "my-instance-template"
  machine_type = "e2-micro"

  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = google_compute_network.vpc_network.self_link
    subnetwork = google_compute_subnetwork.my_subnet.self_link

    access_config {
      // Ephemeral IP address
    }
  }

  metadata_startup_script = <<EOF
  #!/bin/bash
  apt-get update
  apt-get install -y apache2
  echo 'Hello World! Welcome to my website!' > /var/www/html/index.html
  EOF
}



// creating instance 
resource "google_compute_instance_group_manager" "my_instance_group" {
  name               = "my-instance-group"
  base_instance_name = "my-instance"
  zone               = "europe-west1-d"
  target_size        = 1
  version {
    name              = "v1"
    instance_template = google_compute_instance_template.my_template.self_link
  }
}

resource "google_compute_autoscaler" "my_autoscaler" {
  name   = "my-autoscaler"
  zone   = "europe-west1-d"
  target = google_compute_instance_group_manager.my_instance_group.id

  autoscaling_policy {
    max_replicas    = 10
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}


