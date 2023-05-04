# CREATE THE DATASET
resource "google_bigquery_dataset" "bq-iim-dev-01" {
    dataset_id                  = "bq_${var.bucket-function}"
    friendly_name               = "dataset-01"
    description                 = "This is the first dataset i'm creating"
    location                    = "EU"
    default_table_expiration_ms = 3600000

    labels = {
        env = "default"
    }
}