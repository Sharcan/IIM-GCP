locals {
    timestamp = timestamp()
}

variable "region" {
    default = "europe-west1"
}

variable "zone" {
    default = "europe-west1-d"
}

variable "project" {
    type = string
    description = "ID of the project"
    default = "iiim-exo-4"
}

variable "bucket-function" {
    default = "bucket_function_iim_nico"
}