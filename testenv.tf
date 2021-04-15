terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("agentkey.json")

  project = "formal-fragment-310703"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "kubernetes_pod" "test" {
  metadata {
    name = "devopstest"
  }

  spec {
    container {
      image = "meltano/meltano:v1.71.0-python3.7"
      name = "meltano_v1_71_0_python3_7"
    }

    container {
      image = "postgres:9.6.21"
      name = "postgres_9_6_21"
    }

    env {
      name = "environmental"
      value = "test"
    }

    port {
      container_port = 5000
    }

    liveness_probe {
      http_get {
        path = ""
      }
    }
  }
}