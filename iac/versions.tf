terraform {
  required_version = ">= 1.5.6, < 2.0.0"
  required_providers {
    jenkins = {
      source  = "taiidani/jenkins"
      version = ">= 0.10.2"
    }

    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "0.16.9"
    }
  }
}

provider "jenkins" {
  server_url = "http://localhost:8080"
  username   = var.jenkins_username
  password   = var.jenkins_password
}

provider "sonarqube" {
  user = var.sonarqube_username
  pass = var.sonarqube_password
  host = "http://localhost:9000"
}
