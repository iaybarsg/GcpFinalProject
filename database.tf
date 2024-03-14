
// creating CloudSQL instance 
resource "google_sql_database_instance" "default" {
  name             = "my-postgres-instance"
  region           = "europe-west1"
  database_version = "POSTGRES_12"

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      private_network = google_compute_network.vpc_network.self_link
    }
  }
}



