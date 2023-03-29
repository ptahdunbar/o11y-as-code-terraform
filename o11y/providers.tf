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
  account_id = data.vault_generic_secret.NEW_RELIC_ACCOUNT_ID.data.token_secret
  api_key = data.vault_generic_secret.NEW_RELIC_API_KEY.data.token_secret
  region = var.NEW_RELIC_REGION
}

provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  # address = "https://vault.example.net:8200"
  address = var.VAULT_ADDR
  namespace = var.VAULT_NAMESPACE
}
