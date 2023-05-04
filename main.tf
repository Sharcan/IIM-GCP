terraform {
    required_providers {
        google = {
        source = "hashicorp/google"
        }
    }
    backend "gcs" {
        bucket  = "bucket-iim-dev-01"
        prefix  = "terraform/state"
    }
}

provider "google" {
    version = "4.63.1"
    project = "${var.project}"
    region  = "${var.region}"
    zone    = "${var.zone}"
}

# ACTIVATE FUNCTIONS API
resource "google_project_service" "cloud-functions" {
  project = var.project
  service = "cloudfunctions.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

# ACTIVE BUILD API
resource "google_project_service" "cloud-build" {
  project = var.project
  service = "cloudbuild.googleapis.com"

  disable_dependent_services = true
  disable_on_destroy         = false
}

module "storage" {
    source = "./storage"
}

module "functions" {
    source = "./functions"
}

module "big-query" {
    source = "./big-query"
}

module "layout" {
    source = "./layout"
}