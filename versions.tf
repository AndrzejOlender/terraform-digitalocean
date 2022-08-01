terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  } 
  backend "remote" {
    organization = "olender"
    workspaces {
      name = "terraform-digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.digital_ocean_token
}


