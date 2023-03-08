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
make
make up
```

#### Configure your secrets
```
make source
```

### Run Terraform
```
cd o11y
terraform apply
terraform down
```

## LICENSE

This is licensed with the Apache 2.0 [license](LICENSE).