# get the New Relic terraform provider
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = var.NEW_RELIC_ACCOUNT_ID
  api_key = var.NEW_RELIC_API_KEY
  region = var.NEW_RELIC_REGION
}