---
slug: lab-refresh
id: rlkxbypobqap
type: challenge
title: 'Lab: Refresh'
teaser: Reverting manual changes with terraform refresh
notes:
- type: text
  contents: |-
    # Lab: Reverting manual changes

    In this challenge, you're tasked with
    - Manually modifying resources in the New Relic UI
    - Refreshing the state with `terraform refresh`
    - Reverting manual changes with `terraform apply`
tabs:
- title: Terminal
  type: terminal
  hostname: docker-vm
  workdir: /newrelic/o11y
- title: Editor
  type: code
  hostname: docker-vm
  path: /newrelic/o11y
difficulty: basic
timelimit: 600
---
🧪 Step 1: Modify an existing resource
=======================

- Navigate to your imported New Relic Dashboard created in the previous challenge and delete some stuff.

🧪 Step 2: terraform refresh
=========

- In the terminal tab, `cd o11y`, run `terraform refresh` to refresh the state of your resources.

```
terraform refresh
```

🏁 Step 3: terraform apply
=========

- (Optional) Using the Terminal tab, source your environment variables by navigating to the `o11y` directory and running the following command:

```
. .env
```

- To fix any manual changes to your resources, run `terraform apply` and confirm the changes.

```
terraform apply
```

To complete the challenge, press **Check**

