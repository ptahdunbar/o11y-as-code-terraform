---
slug: lab-alerts-workflows-and-notifications
id: uh4h9z1ekjxc
type: challenge
title: 'Lab: Alerts, Workflows and Notifications'
teaser: Setup alerts and notifications before issues become a larger issue.
notes:
- type: text
  contents: |-
    # Creating Alerts, Workflows and Notifications

    In this challenge, you're tasked with
    - Creating alert policies for each app
    - Each app will monitor for latency and error rates
    - Configure an email destintation and channel
    - Adding a workflow for sending notifications when certain thresholds are met.
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
timelimit: 1800
---
🧪 Step 1: Create Alert Policies
=======================

- Use `newrelic_alert_policy` to create alert policies
- In `o11y/main.tf` add this code snippet after `# TODO: Create an alert policy for the apps`

```
resource "newrelic_alert_policy" "alert_policies" {
  name = "${var.APPS[count.index]} alert policy (TF)"
  count = length(var.APPS)
  incident_preference = "PER_CONDITION"
}
```

- Remember to save the file.

🧪 Step 2: Create Alert Conditions
=======================

- Use `newrelic_nrql_alert_condition` to create alert conditions observing latency
1. In `o11y/main.tf` add this code snippet after `# TODO: Create an alert condition observing latency of the apps`

```
resource "newrelic_nrql_alert_condition" "Latency" {
  count              = length(var.APPS)
  policy_id          = newrelic_alert_policy.alert_policies[count.index].id
  name               = "${var.APPS[count.index]}-latency-baseline (TF)"
  account_id         = var.NEW_RELIC_ACCOUNT_ID
  type               = var.ALERT_LATENCY.type
  description        = var.ALERT_LATENCY.description
  enabled            = var.ALERT_LATENCY.enabled
  aggregation_method = var.ALERT_LATENCY.aggregation_method
  aggregation_delay  = var.ALERT_LATENCY.aggregation_delay
  baseline_direction = var.ALERT_LATENCY.baseline_direction
  slide_by           = var.ALERT_LATENCY.slide_by

  nrql {
    query = replace(var.ALERT_LATENCY.query, "__APP_NAME__", var.APPS[count.index])
  }

  critical {
    operator              = var.ALERT_LATENCY.critical_operator
    threshold             = var.ALERT_LATENCY.critical_threshold
    threshold_duration    = var.ALERT_LATENCY.critical_threshold_duration
    threshold_occurrences = var.ALERT_LATENCY.critical_threshold_occurrences
  }

  warning {
    operator              = var.ALERT_LATENCY.warning_operator
    threshold             = var.ALERT_LATENCY.warning_threshold
    threshold_duration    = var.ALERT_LATENCY.warning_threshold_duration
    threshold_occurrences = var.ALERT_LATENCY.warning_threshold_occurrences
  }
}
```

- Use `newrelic_nrql_alert_condition` to create alert conditions observing error rates
2. In `o11y/main.tf` add this code snippet after `# TODO: Create an alert condition observing error rates of the apps`

```
resource "newrelic_nrql_alert_condition" "ErrorRate" {
  count              = length(var.APPS)
  policy_id          = newrelic_alert_policy.alert_policies[count.index].id
  name               = "${var.APPS[count.index]}-error-rate-baseline (TF)"
  account_id         = var.NEW_RELIC_ACCOUNT_ID
  type               = var.ALERT_ERROR_RATE.type
  description        = var.ALERT_ERROR_RATE.description
  enabled            = var.ALERT_ERROR_RATE.enabled
  aggregation_method = var.ALERT_ERROR_RATE.aggregation_method
  aggregation_delay  = var.ALERT_ERROR_RATE.aggregation_delay
  baseline_direction = var.ALERT_ERROR_RATE.baseline_direction
  slide_by           = var.ALERT_ERROR_RATE.slide_by

  nrql {
    query = replace(var.ALERT_ERROR_RATE.query, "__APP_NAME__", var.APPS[count.index])
  }

  critical {
    operator              = var.ALERT_ERROR_RATE.critical_operator
    threshold             = var.ALERT_ERROR_RATE.critical_threshold
    threshold_duration    = var.ALERT_ERROR_RATE.critical_threshold_duration
    threshold_occurrences = var.ALERT_ERROR_RATE.critical_threshold_occurrences
  }

  warning {
    operator              = var.ALERT_ERROR_RATE.warning_operator
    threshold             = var.ALERT_ERROR_RATE.warning_threshold
    threshold_duration    = var.ALERT_ERROR_RATE.warning_threshold_duration
    threshold_occurrences = var.ALERT_ERROR_RATE.warning_threshold_occurrences
  }
}
```

- Use `newrelic_nrql_alert_condition` to create alert conditions observing traffic patterns
- In `o11y/main.tf` add this code snippet after `# TODO: Create an alert condition observing traffic of the apps`

```
resource "newrelic_nrql_alert_condition" "Traffic" {
  count              = length(var.APPS)
  policy_id          = newrelic_alert_policy.alert_policies[count.index].id
  name               = "${var.APPS[count.index]}-traffic-baseline (TF)"
  account_id         = var.NEW_RELIC_ACCOUNT_ID
  type               = var.ALERT_TRAFFIC.type
  description        = var.ALERT_TRAFFIC.description
  enabled            = var.ALERT_TRAFFIC.enabled
  aggregation_method = var.ALERT_TRAFFIC.aggregation_method
  aggregation_delay  = var.ALERT_TRAFFIC.aggregation_delay
  baseline_direction = var.ALERT_TRAFFIC.baseline_direction
  slide_by           = var.ALERT_TRAFFIC.slide_by

  nrql {
    query = replace(var.ALERT_TRAFFIC.query, "__APP_NAME__", var.APPS[count.index])
  }

  critical {
    operator              = var.ALERT_TRAFFIC.critical_operator
    threshold             = var.ALERT_TRAFFIC.critical_threshold
    threshold_duration    = var.ALERT_TRAFFIC.critical_threshold_duration
    threshold_occurrences = var.ALERT_TRAFFIC.critical_threshold_occurrences
  }

  warning {
    operator              = var.ALERT_TRAFFIC.warning_operator
    threshold             = var.ALERT_TRAFFIC.warning_threshold
    threshold_duration    = var.ALERT_TRAFFIC.warning_threshold_duration
    threshold_occurrences = var.ALERT_TRAFFIC.warning_threshold_occurrences
  }
}
```

- Use `newrelic_nrql_alert_condition` to create alert conditions observing saturation
3. In `o11y/main.tf` add this code snippet after `# TODO: Create an alert condition observing saturation of the apps`

```
resource "newrelic_nrql_alert_condition" "Saturation" {
  count              = length(var.APPS)
  policy_id          = newrelic_alert_policy.alert_policies[count.index].id
  name               = "${var.APPS[count.index]}-saturation-baseline (TF)"
  account_id         = var.NEW_RELIC_ACCOUNT_ID
  type               = var.ALERT_SATURATION.type
  description        = var.ALERT_SATURATION.description
  enabled            = var.ALERT_SATURATION.enabled
  aggregation_method = var.ALERT_SATURATION.aggregation_method
  aggregation_delay  = var.ALERT_SATURATION.aggregation_delay
  baseline_direction = var.ALERT_SATURATION.baseline_direction
  slide_by           = var.ALERT_SATURATION.slide_by

  nrql {
    query = replace(var.ALERT_SATURATION.query, "__APP_NAME__", var.APPS[count.index])
  }

  critical {
    operator              = var.ALERT_SATURATION.critical_operator
    threshold             = var.ALERT_SATURATION.critical_threshold
    threshold_duration    = var.ALERT_SATURATION.critical_threshold_duration
    threshold_occurrences = var.ALERT_SATURATION.critical_threshold_occurrences
  }

  warning {
    operator              = var.ALERT_SATURATION.warning_operator
    threshold             = var.ALERT_SATURATION.warning_threshold
    threshold_duration    = var.ALERT_SATURATION.warning_threshold_duration
    threshold_occurrences = var.ALERT_SATURATION.warning_threshold_occurrences
  }
}
```

- Remember to save the file.

🧪 Step 2: Setup Workflows
=======================

- Use `newrelic_workflow` to create a new workflow
- In `o11y/main.tf` add this code snippet after `# TODO: Create a workflow for each apps`

```
resource "newrelic_workflow" "Workflow" {
  for_each           = toset(var.APPS)
  name                  = "Workflow ${each.key} (TF)"
  account_id            = var.NEW_RELIC_ACCOUNT_ID
  muting_rules_handling = "NOTIFY_ALL_ISSUES"

  issues_filter {
    name = "Filter-name"
    type = "FILTER"
    predicate {
      attribute = "accumulations.policyName"
      operator  = "CONTAINS"
      values    = ["O11yAsCode-${each.key}"]
    }
  }
  destination {
    channel_id = newrelic_notification_channel.alert_notification_email.id
  }
}
```

- Remember to save the file.

🧪 Step 2: Create Notifications
=======================

- Use `newrelic_notification_destination` to create a notification destination
- In `o11y/main.tf` add this code snippet after `# TODO: Create an email notification destination using the email variable`

```
resource "newrelic_notification_destination" "alert_email_destination" {
  name = "email"
  type = "EMAIL"

  property {
    key   = "email"
    value = var.ALERT_NOTIFICATION_EMAIL
  }
}
```

- Use `newrelic_notification_channel` to create a notification channel
- In `o11y/main.tf` add this code snippet after `# TODO: Create an email notification channel using the email destination`

```
resource "newrelic_notification_channel" "alert_notification_email" {
  account_id     = var.NEW_RELIC_ACCOUNT_ID
  name           = "email"
  type           = "EMAIL"
  destination_id = newrelic_notification_destination.alert_email_destination.id
  product        = "IINT"

  property {
    key   = "subject"
    value = "name: {{ alert_notification_email }}"
  }
}
```

- Remember to save the file.

🏁 Step 3: Finish
=======================


- Using the Terminal tab, preview the changes using the following command:

```
terraform plan
```

- Once you're satisfied with the changes, run the following command to apply the changes.

```
terraform apply
```

- To complete the challenge, press **Check**
