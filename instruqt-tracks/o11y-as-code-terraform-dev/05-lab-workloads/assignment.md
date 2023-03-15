---
slug: lab-workloads
id: j8pd8l0eowqh
type: challenge
title: 'Lab: Workloads'
teaser: Use Workloads to organize your resources
notes:
- type: text
  contents: |-
    # Use Workloads to organize your resources

    In this challenge, you're tasked with
    - Creating a workload to organize all of your resources into one view (Full Stack)
    - Linking to your workload and output a permalink
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
🧪 Step 1: Create a Workload
=======================

- A Workload is a collection of everything that you or your team is responsible for monitoring, troubleshooting and improving.
- Workloads are created using a common tag to group all resources together.
- Add this code snippet after `# TODO: Create a workload using the team tag`

```
resource "newrelic_workload" "O11yAsCode" {
  name = var.MY_TEAM_WORKLOAD_NAME
  account_id = (var.NEW_RELIC_ACCOUNT_ID)

  # Include entities with a set of tags.
  entity_search_query {
    query = var.MY_TEAM_WORKLOAD_QUERY
  }

  entity_guids = [
    newrelic_one_dashboard_json.imported-dashboard.guid,
    newrelic_one_dashboard_json.custom-dashboard.guid,
  ]
}
```

- Remember to save the file.

- Review `TF_VAR_MY_TEAM_WORKLOAD_QUERY` and `TF_VAR_TAGS` in `o11y/terraform.tfvars`
- Ensure that the `TF_VAR_TAGS` you create are reflected in `TF_VAR_MY_TEAM_WORKLOAD_QUERY`

🧪 Step 2: Link to your workload
=======================

- Create a link to your workload by outputting the permalink.
- Add this code snippet after `# TODO: Output the permalink to the workload`

```
output "my-team-workload" {
  value = newrelic_workload.O11yAsCode.permalink
}
```

- Remember to save the file.

🏁 Step 3: Finish
=======================


- Using the Terminal tab, preview the changes using the following command:

```
terraform plan
```

- When your ready, apply your changes:

```
terraform apply
```

- To complete the challenge, press **Check**
