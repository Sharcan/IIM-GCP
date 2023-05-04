# TABLE THAT WILL BE INSERTED IN THE DATASET: bq-iiim-exo-4
resource "google_bigquery_table" "bq-table-iim-dev-01" {
    dataset_id = google_bigquery_dataset.bq-iim-dev-01.dataset_id
    table_id   = "${var.bucket-function}_users"
    deletion_protection=false

    time_partitioning {
        type = "DAY"
    }

    labels = {
        env = "default"
    }

    # schema of the data that will be inserted
    schema = <<EOF
    [
    {
        "name": "lastname",
        "type": "STRING",
        "description": "Lastname of user"
    },
    {
        "name": "firstname",
        "type": "STRING",
        "description": "Firstname of user"
    }
    ]
    EOF
}
