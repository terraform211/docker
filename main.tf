terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "test_image" {
  name = "nodered/node-red"
}

resource "docker_container" "doc_con" {
  name  = "nodered"
  image = docker_image.test_image.latest

  ports {
    internal = "1880"
    external = "1880"
  }
}


