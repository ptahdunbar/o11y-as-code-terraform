[![New Relic Experimental header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Experimental.png)](https://opensource.newrelic.com/oss-category/#new-relic-experimental)

# Workshop: Observability as Code with Terraform

This app demonstrates how to incorporate Terraform and New Relic together using Observability as Code.

## Set up Terraform and manage your secrets

### Setup accounts
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [New Relic](https://newrelic.com/signup)

#### Confirm terraform is installed
```
which terraform
```

#### Install Terraform
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

#### Get Credentials
- https://one.newrelic.com/launcher/api-keys-ui.api-keys-launcher

#### Clone the repo and run the app
```
git clone
docker compose up
```

#### Configure your secrets
```
cd o11y
vim variables.tf
```

```
export TF_VAR_NEW_RELIC_ACCOUNT_ID=1234567
export TF_VAR_NEW_RELIC_API_KEY=AABBCC
export TF_VAR_NEW_RELIC_REGION=US
export TF_VAR_APPS='["web-api", "login-service"]'
export TF_VAR_ALERT_NOTIFICATION_EMAIL=acme@example.com
export TF_VAR_SYNTHETIC_MONITOR_URL=http://example.com
```

### Run Terraform
```
cd o11y
terraform apply
terraform down
```

## LICENSE

This is licensed with the Apache 2.0 [license](LICENSE).