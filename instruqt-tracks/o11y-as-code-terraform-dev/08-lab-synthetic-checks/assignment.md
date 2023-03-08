---
slug: lab-synthetic-checks
id: vdmjynj3lllm
type: challenge
title: 'Lab: Synthetic Checks'
teaser: Creating Synthetic Monitors
notes:
- type: text
  contents: |-
    # Creating Synthetic Monitors

    In this challenge, you're tasked with
    - Monitoring a set of URLs for invalid SSL certificates
    - Monitoring a set of URLs for broken links
tabs:
- title: Editor
  type: code
  hostname: docker-vm
  path: /newrelic/o11y
- title: Terminal
  type: terminal
  hostname: docker-vm
  workdir: /newrelic/o11y
difficulty: basic
timelimit: 600
---
🧪 Step 1: Check for valid SSL certificates
=======================

- Use the `newrelic_synthetics_cert_check_monitor` to check for invalid SSL certificates.
- In `o11y/main.tf` add this code snippet after `# TODO: Create a Synthetics monitor to check for valid SSL certificates`

```
resource "newrelic_synthetics_cert_check_monitor" "cert-check-monitor" {
  count                  = length(var.SYNTHETIC_CHECK_SSL)
  name                   = "cert-check-monitor-${var.SYNTHETIC_CHECK_SSL[count.index]}"
  domain                 = "${var.SYNTHETIC_CHECK_SSL[count.index]}"
  # Public minion location
  # https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/administration/synthetic-public-minion-ips/#location
  locations_public       = ["AWS_SA_EAST_1", "AWS_US_EAST_1"]
  certificate_expiration = "10"
  period                 = "EVERY_6_HOURS"
  status                 = "ENABLED"

  dynamic "tag" {
    for_each = var.TAGS
    content {
      key    = tag.key
      values = [tag.value]
    }
  }
}
```

- Remember to save the file.

- Review the `TF_VAR_SYNTHETIC_CHECK_SSL` variable in `o11y/.env`

🧪 Step 2: Check for broken links
=======================

- Use the `newrelic_synthetics_broken_links_monitor` to check for broken links.
- In `o11y/main.tf` add this code snippet after `# TODO: Create a Synthetics monitor to check for broken links`

```
resource "newrelic_synthetics_broken_links_monitor" "monitor" {
  count                  = length(var.SYNTHETIC_CHECK_SSL)
  name                   = "broken-links-monitor-${var.SYNTHETIC_CHECK_SSL[count.index]}"

  uri              = "${var.SYNTHETIC_CHECK_SSL[count.index]}"
  # Public minion location
  # https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/administration/synthetic-public-minion-ips/#location
  locations_public       = ["AWS_SA_EAST_1", "AWS_US_EAST_1"]
  period                 = "EVERY_6_HOURS"
  status                 = "ENABLED"
  dynamic "tag" {
    for_each = var.TAGS
    content {
      key    = tag.key
      values = [tag.value]
    }
  }
}
```
- Remember to save the file.

- Review the `TF_VAR_SYNTHETIC_CHECK_SSL` variable in `o11y/.env`

🏁 Step 3: Finish
=======================

- Using the Terminal tab, source your environment variables by navigating to the `o11y` directory and running the following command:

```
. .env
```

- Preview the changes using the following command:

```
terraform plan
```

- Once you're satisfied with the changes, run the following command to apply the changes.

```
terraform apply
```

To complete the challenge, press **Check**
