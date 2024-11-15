module "bigquery" {
  source  = "terraform-google-modules/bigquery/google"
  version = "~> 9.0"

  dataset_id                  = "conversational_agents_logs"
  dataset_name                = "Conversational Agents Logs"
  description                 = "This is a table to collect Conversational Agents logs."
  project_id                  = "<PROJECT_ID>"
  location                    = "us-central1"
  default_table_expiration_ms = 3600000
  
  tables = [
  {
    table_id           = "dialogflow_bigquery_export_data",
    schema             =  jsonencode([
      {"name": "project_id", "type": "STRING"},
      {"name": "agent_id", "type": "STRING"},
      {"name": "conversation_name", "type": "STRING"},
      {"name": "turn_position", "type": "INTEGER"},
      {"name": "request_time", "type": "TIMESTAMP"},
      {"name": "language_code", "type": "STRING"},
      {"name": "request", "type": "JSON"},
      {"name": "response", "type": "JSON"},
      {"name": "partial_responses", "type": "JSON"},
      {"name": "derived_data", "type": "JSON"},
      {"name": "conversation_signals", "type": "JSON"},
      {"name": "bot_answer_feedback", "type": "JSON"}
      ]),
    time_partitioning  = {
      type                     = "DAY",
      field                    = null,
      require_partition_filter = false,
      expiration_ms            = null,
    },
    range_partitioning = null,
    expiration_time = null,
    clustering      = [],
    labels          = null,
  }
  ]
}
