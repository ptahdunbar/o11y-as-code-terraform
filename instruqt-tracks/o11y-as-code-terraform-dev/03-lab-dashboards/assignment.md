---
slug: lab-dashboards
id: u7bfpsr0vh8d
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

- After those steps, create a dashboard resource for the imported dashboard.
- In `o11y/main.tf` add this code snippet after `# TODO: Import a dashboard from a JSON file`

```
resource "newrelic_one_dashboard_json" "imported-dashboard" {
  json = file("dashboards/import.json")
}
```

- Create a link to your imported dashboard
- In `o11y/main.tf` add this code snippet after `# TODO: Output the permalink to the imported dashboard`

```
output "my-team-imported-dashboard" {
  value = newrelic_one_dashboard_json.imported-dashboard.permalink
}
```

- Remember to save the file.

- Using the Terminal tab, preview the changes using the following command:

```
terraform plan
```

- Once you're satisfied with the changes, run the following command to apply the changes.

```
terraform apply
```

🧪 Step 2: Create a dynamic Dashboard
=======================

- Using the Editor tab, review `o11y/dashboards/custom.json.tftpl`
- Notice the variables used `${variable_name}`
- Variables can be passed into the template.

- Create a custom dashboard resource using variables.
- Add this code snippet after `# TODO: Create a dashboard from a template file`

```
resource "newrelic_one_dashboard_json" "custom-dashboard" {
  json = templatefile("dashboards/custom.json.tftpl", {
    account_id = var.NEW_RELIC_ACCOUNT_ID,
    applications = var.APPS,
    dashboard_name: "O11yAsCode Dashboard (TF)",
  })
}
```

- Create a link to your custom dashboard
- In `o11y/main.tf` add this code snippet after `# TODO: Output the permalink to the custom dashboard`

```
output "my-team-custom-dashboard" {
  value = newrelic_one_dashboard_json.custom-dashboard.permalink
}
```

- Remember to save the file.

🏁 Step 3: Finish
=======================



- Using the Terminal tab, navigate to `o11y` directory and run the following command to preview your changes:

```
terraform plan
```

- Once you're satisfied with the changes, run the following command to apply the changes.

```
terraform apply
```

To complete the challenge, press **Check**
