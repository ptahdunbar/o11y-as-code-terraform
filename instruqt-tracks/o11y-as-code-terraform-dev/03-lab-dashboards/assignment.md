---
slug: lab-dashboards
id: mbg8p64yo1fk
type: challenge
title: 'Lab: Dashboards'
teaser: Working with Dashboards
notes:
- type: text
  contents: |-
    # Lab: Dashboards

    In this challenge, you're tasked with
     - Importing a dashboard from New Relic.
     - Link to that imported dashboard
     - Create a dynamic Dashboard based off a template file.
     - Link to that custom dashboard
tabs:
- title: Editor
  type: code
  hostname: docker-vm
  path: /newrelic
- title: Terminal
  type: terminal
  hostname: docker-vm
  workdir: /newrelic
difficulty: basic
timelimit: 600
---
🧪 Step 1: Import a New Relic Dashboard
=======================

1. Navigate to New Relic and create a dashboard.
2. Copy the pre-built dashboard as a json file.
3. Save the file as `o11y/dashboard/import.json`

- Create a dashboard resource for the imported dashboard.
- Add this code snippet after `# TODO: Import a dashboard from a JSON file`

```
resource "newrelic_one_dashboard_json" "imported-dashboard" {
  json = file("dashboards/import.json")
}
```

- Create a link to your imported dashboard
- Add this code snippet after `# TODO: Output the permalink to the imported dashboard`

```
output "my-team-imported-dashboard" {
  value = newrelic_one_dashboard_json.imported-dashboard.permalink
}
```

- Preview your changes:

```
terraform plan
```

- When your ready, apply your changes:

```
terraform apply
```

🧪 Step 2: Setup applications
=======================


🏁 Step 3: Finish
=======================
To complete the challenge, press **Check**
