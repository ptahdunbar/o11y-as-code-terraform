# NEW_RELIC_ACCOUNT_ID key for account ID
data "vault_generic_secret" "NEW_RELIC_ACCOUNT_ID" {
  path = var.NEW_RELIC_ACCOUNT_ID
}

# NEW_RELIC_API_KEY key for New Relic API
data "vault_generic_secret" "NEW_RELIC_API_KEY" {
  path = var.VAULT_NEW_RELIC_API_KEY_PATH
}
data "vault_generic_account" "NEW_RELIC_KEY" {
  path = var.VAULT_NEW_RELIC_KEY_PATH
}

data "vault_generic_account" "NEW_RELIC_ACCOUNT_ID" {
  path = var.VAULT_NEW_RELIC_ACCOUNT_ID_PATH
}

data "vault_generic_account" "NEW_RELIC_API_KEY" {
  path = var.VAULT_NEW_RELIC_API_KEY_PATH
}
