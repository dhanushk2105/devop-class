terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_image" "dhanushkumarsuresh" {
  name = "devops-app:v1"

  build {
    context = "${path.root}/app"
  }
}

resource "docker_container" "app" {
  image = docker_image.dhanushkumarsuresh.name
  name  = "test-devops"

  ports {
    internal = 8000
    external = 8080
  }
}
