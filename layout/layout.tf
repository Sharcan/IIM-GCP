# DASHBOARD
resource "google_monitoring_dashboard" "dashboard-iim-dev-01" {
  dashboard_json = <<EOF
{
  "displayName": "IIM-GCP Dashboard",
  "gridLayout": {
    "widgets": [
      {
        "title": "Nombre d'executions",
        "xyChart": {
          "chartOptions": {
            "mode": "COLOR"
          },
          "dataSets": [
            {
              "minAlignmentPeriod": "3600s",
              "plotType": "LINE",
              "timeSeriesQuery": {
                "timeSeriesFilter": {
                  "aggregation": {
                    "perSeriesAligner": "ALIGN_RATE"
                  },
                  "filter": "metric.type=\"cloudfunctions.googleapis.com/function/execution_count\" resource.type=\"cloud_function\"",
                  "secondaryAggregation": {}
                },
                "unitOverride": "1"
              }
            }
          ],
          "timeshiftDuration": "0s",
          "yAxis": {
            "scale": "LINEAR"
          }
        }
      },
      {
        "timeSeriesTable": {
        "dataSets": [
            {
            "minAlignmentPeriod": "60s",
            "timeSeriesQuery": {
                "timeSeriesFilter": {
                "aggregation": {
                    "alignmentPeriod": "60s",
                    "perSeriesAligner": "ALIGN_PERCENTILE_50"
                },
                "filter": "metric.type=\"bigquery.googleapis.com/query/execution_times\" resource.type=\"bigquery_project\"",
                "secondaryAggregation": {
                    "alignmentPeriod": "60s",
                    "perSeriesAligner": "ALIGN_NONE"
                }
                }
            }
            }
        ],
        "metricVisualization": "NUMBER"
        },
        "title": "Temps moyenne d'execution | Requête BigQuery"
      }
    ]
  }
}

EOF
}
