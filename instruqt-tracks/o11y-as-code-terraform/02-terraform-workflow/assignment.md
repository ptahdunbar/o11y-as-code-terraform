---
slug: terraform-workflow
id: aiexvh69ywaq
type: challenge
title: Terraform workflow
teaser: Review terraform commands
notes:
- type: text
  contents: |-
    # Terraform Workflow

    In this challenge, you're tasked with
    - Adding your New Relic credentials to `o11y/terraform.tfvars`
    - initializing terraform using `terraform init`
    - Validating your terraform config using `terraform validate`
    - Previewing your changes using `terraform plan`
    - Applying your changes using `terraform apply`
tabs:
- title: Editor
  type: code
  hostname: docker-vm
  path: /newrelic/o11y
- title: Terminal
  type: terminal
  hostname: docker-vm
  workdir: /newrelic
difficulty: basic
timelimit: 600
---
🧪 Step 1: Preparing your terraform `o11y/terraform.tfvars` file
=======================

- Using the Editor tab, navigate to `o11y/terraform.tfvars` and drop in your `NEW_RELIC_ACCOUNT_ID` and `NEW_RELIC_API_KEY` which is different from your `NEW_RELIC_LICENSE_KEY`.

- Your `NEW_RELIC_API_KEY` should start with `NRAK-`

- Update `ALERT_NOTIFICATION_EMAIL` to point to your email address.

🧪 Step 2: terraform init
=======================

- In the Terminal tab, change directory to `o11y` then run the following command:

```
terraform init
```

🧪 Step 3: terraform validate
=======================

- In the Editor tab, open `o11y/main.tf`
- In `o11y/main.tf` add this code snippet after `# TODO: Output the names of the apps we are going to monitor`

```
output "o11y-as-code-apps" {
  value = toset(var.APPS)
}
```

- Remember to save the file.

- Using the Terminal tab, change directory to `o11y` then validate the changes by running the following command:

```
terraform validate
```

🧪 Step 3: terraform plan
=======================

- Using the Terminal tab, preview the changes using the following command:

```
terraform plan
```

🏁 Step 4: terraform apply
=======================

- Once you're satisfied with the changes, run the following command to apply the changes.

```
terraform apply
```

- To complete the challenge, press **Check**
