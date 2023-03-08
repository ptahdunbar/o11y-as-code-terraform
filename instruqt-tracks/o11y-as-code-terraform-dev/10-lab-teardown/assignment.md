---
slug: lab-teardown
id: up9yyp7txdtb
type: challenge
title: 'Lab: Teardown'
teaser: Teardown all your resources.
notes:
- type: text
  contents: |-
    # Terraform Destroy

    In this challenge, you're tasked with
    - cleaning up your environment by running `terraform destroy`
tabs:
- title: Terminal
  type: terminal
  hostname: docker-vm
  workdir: /newrelic/o11y
difficulty: basic
timelimit: 600
---
🏁 Run Pulumi Down
=========

- In the terminal tab, `cd o11y`, run `terraform destroy` and confirm to destroy all of your resources in New Relic.

- This will reset your environment while still maintaining the code to reproduce it again if and when needed.

```
terraform destroy
```

- To complete the challenge, press **Check**
