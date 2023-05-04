# BUCKET THAT WILL STORE TERRAFORM STATE
resource "google_storage_bucket" "bucket-iim-dev-01" {
    name     = "bucket-iim-dev-01"
    location = "EU"
    website {
        main_page_suffix = "index.html"
        not_found_page   = "404.html"
    }
    force_destroy = true
}