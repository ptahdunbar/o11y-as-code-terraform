---
slug: lab-service-levels
id: a0ijbbfqljwx
type: challenge
title: 'Lab: Service Levels'
teaser: Creating SLIs and SLOs for your applications
notes:
- type: text
  contents: |-
    # Creating SLIs and SLOs for your applications

    In this challenge, you're tasked with
    - Create a Serivce Level Indicator for the latency of your applications
    - Create a Serivce Level Indicator for the error rates of your applications
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
🧪 Step 1: Create a SLI for latency
=======================

- Create a service level indicator for each application using `newrelic_service_level`
- In `o11y/main.tf` add this code snippet after `# TODO: Create a Serivce Level Indicator for the latency of your applications`

```
resource "newrelic_service_level" "latency" {
  count = length(var.APPS)
  guid = data.newrelic_entity.APPS[count.index].guid
  name = "Latency for ${var.APPS[count.index]}"
  description = "Proportion of requests that are served faster than a threshold."

  events {
    account_id = var.NEW_RELIC_ACCOUNT_ID
    valid_events {
      from = "Transaction"
      where = "appName = '${var.APPS[count.index]}' AND (transactionType='Web')"
    }
    good_events {
      from = "Transaction"
      where = "appName = '${var.APPS[count.index]}' AND (transactionType= 'Web') AND duration < 0.1"
    }
  }

  objective {
    target = 99.00
    time_window {
      rolling {
        count = 7
        unit = "DAY"
      }
    }
  }
}
```

- Remember to save the file.

🧪 Step 2: Create a SLI for error rates
=======================

- Create a service level indicator for each application using `newrelic_service_level`
- In `o11y/main.tf` add this code snippet after `# TODO: Create a Serivce Level Indicator for the error rates of your applications`

```
resource "newrelic_service_level" "error-rate" {
  count = length(var.APPS)
  guid = data.newrelic_entity.APPS[count.index].guid
  name = "Error Rate for ${var.APPS[count.index]}"
  description = "Proportion of requests that are returning errors above an acceptable threshold."

  events {
    account_id = var.NEW_RELIC_ACCOUNT_ID
    valid_events {
      from = "Transaction"
      where = "appName = '${var.APPS[count.index]}' AND (transactionType='Web')"
    }
    bad_events {
      from = "Transaction"
      where = "appName = '${var.APPS[count.index]}' AND (transactionType= 'Web') AND error.expected IS FALSE"
    }
  }

  objective {
    target = 99.00
    time_window {
      rolling {
        count = 7
        unit = "DAY"
      }
    }
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

