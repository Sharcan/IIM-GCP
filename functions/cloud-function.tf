locals {
    timestamp = timestamp()
}

# DEFINING HOW TE FILE MUST BE COMPRESSED
data "archive_file" "source-iim-dev-01" {
    type        = "zip"
    source_dir  = "./functions/hello-world"
    output_path = "./tmp/function-${local.timestamp}.zip"
}

# STORAGE BUCKET FUNCTION
resource "google_storage_bucket" "bucket-function-iim-dev-01" {
    name = "function-${var.project}"
    location = "${var.region}"
}

# STORAGE BUCKET OBJECT ZIP
resource "google_storage_bucket_object" "zip-iim-dev-01" {
    source       = data.archive_file.source-iim-dev-01.output_path
    content_type = "application/zip"

    name         = "src-${data.archive_file.source-iim-dev-01.output_md5}.zip"
    bucket       = google_storage_bucket.bucket-function-iim-dev-01.name
}

# GOOGLE CLOUD FUNCTION
resource "google_cloudfunctions_function" "function-iim-dev-01" {
    project     = var.project
    name        = "function-helloworld-iim-dev-01"
    description = "Hello world function"
    runtime     = "nodejs18"
    region      = "${var.region}"

    entry_point  = "helloGET"
    trigger_http = true

    # Variables reliant au bucket ET au ZIP
    source_archive_bucket = google_storage_bucket.bucket-function-iim-dev-01.name
    source_archive_object = google_storage_bucket_object.zip-iim-dev-01.name
}

# ADD AUTORISATION TO ALL USERS
resource "google_cloudfunctions_function_iam_member" "invoker-iim-dev-01" {
  project        = google_cloudfunctions_function.function-iim-dev-01.project
  region         = google_cloudfunctions_function.function-iim-dev-01.region
  cloud_function = google_cloudfunctions_function.function-iim-dev-01.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}