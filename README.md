[![New Relic Experimental header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Experimental.png)](https://opensource.newrelic.com/oss-category/#new-relic-experimental)

# Workshop: Observability as Code with Terraform

This app demonstrates how to incorporate Terraform and New Relic together using Observability as Code.

## Workshop Overview

- Getting Started (Getting Started with Terraform)
- Terraform Workflow (Review terraform commands)
- Lab: Dashboards (Working with Dashboards)
- Lab: Tags (Tagging your applications)
- Lab: Workloads (Use Workloads to organize your resources)
- Lab: Refresh (Reverting manual changes with terraform refresh)
- Lab: Service Levels (Creating SLIs and SLOs for your applications)
- Lab: Synthetic Checks (Creating Synthetic Monitors)
- Lab: Alerts, Workflows and Notifications (Setup alerts and notifications before issues become a larger issue.)
- Lab: Teardown (Teardown all your resources.)



## Set up Terraform and manage your secrets

### Before you get started
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [New Relic](https://newrelic.com/signup)

#### Install Terraform
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

#### Confirm terraform is installed
```
which terraform
```

#### Get API Keys for New Relic
- https://one.newrelic.com/launcher/api-keys-ui.api-keys-launcher

#### Clone the repo and run the app
```
git clone
make
make up
```

#### Configure your secrets
```
make
```

- Foreach `apps/*/.env` file, update them with the credentials retrieved from New Relic

### Run Terraform
```
cd o11y
terraform apply
terraform down
```

## LICENSE

This is licensed with the Apache 2.0 [license](LICENSE).
