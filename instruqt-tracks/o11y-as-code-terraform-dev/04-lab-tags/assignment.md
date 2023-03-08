---
slug: lab-tags
id: 60wvgsd37hzb
type: challenge
title: 'Lab: Tags'
teaser: Tagging your applications
notes:
- type: text
  contents: |-
    # Lab: Tagging your applications

    In this challenge, you're tasked with
    - fetching your application resources from New Relic
    - tagging your apps with `team` and `env` key value pairs.
    - reviewing your tags in New Relic
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
🧪 Step 1: Add tags to your applications
=======================

- Fetch the application metadata from New Relic
- In `o11y/main.tf` add this code snippet after `# TODO: Fetch the apps from New Relic`

```
data "newrelic_entity" "APPS" {
  count = length(var.APPS)
  name  = var.APPS[count.index]
  type = "APPLICATION"
  domain = "APM"
}
```

- Output the app metadata
- In `o11y/main.tf` add this code snippet after `# TODO: Output the guids of the apps we are going to monitor`

```
output "o11y_apps" {
  value = data.newrelic_entity.APPS[*].guid
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

🧪 Step 2: Add tags to your applications
=======================

- Using the metadata retrieved in the previous step, we now have access to the guid which `newrelic_entity_tags` needs.
- Review the `TF_VAR_TAGS` environment variable in `o11y/.env`
- Use environment variables to tag your applications dynamically
- In `o11y/main.tf` add this code snippet after `# TODO: Tag each app with the team and environment values`

```
resource "newrelic_entity_tags" "APPS" {
  count = length(var.APPS)
  guid  = data.newrelic_entity.APPS[count.index].guid

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

🏁 Step 3: Finish
=======================

- Using the Terminal tab, source your environment variables by navigating to the `o11y` directory and running the following command:

```
source .env
```

- Using the Terminal tab, preview the changes using the following command:

```
terraform plan
```

- Once you're satisfied with the changes, run the following command to apply the changes.

```
terraform apply
```

- To complete the challenge, press **Check**
