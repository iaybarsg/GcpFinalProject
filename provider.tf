// choosing cloud provider and project info 

provider "google" {
  credentials = file("/Users/ibrahimaybarsgezici/Desktop/GCP.BitirmeProju/gold-gateway-417010-cc368ea9381e.json")
  project     = "gold-gateway-417010"
  region      = "europe-west1"
}



