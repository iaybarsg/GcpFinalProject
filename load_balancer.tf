// creating load balancer 

resource "google_compute_health_check" "default" {
  name               = "my-health-check"
  check_interval_sec = 5
  timeout_sec        = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

  http_health_check {
    port    = 80
    request_path = "/"
  }
}


resource "google_compute_backend_service" "default" {
  name        = "my-backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  health_checks = [google_compute_health_check.default.self_link]

  backend {
    group = google_compute_instance_group_manager.my_instance_group.instance_group
  }
}

resource "google_compute_url_map" "default" {
  name            = "my-url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name    = "my-http-proxy"
  url_map = google_compute_url_map.default.self_link
}
