---
slug: getting-started
id: poxe8s7bwoob
type: challenge
title: Getting Started
teaser: Getting Started with Terraform
notes:
- type: text
  contents: |-
    # Getting Started with Observability as Code

    In this challenge, you're tasked with
    - configuring your applications with the proper `NEW_RELIC_LICENSE_KEY`
    - starting your applications
    - checking the logs to ensure everything is working
tabs:
- title: Terminal
  type: terminal
  hostname: docker-vm
  workdir: /newrelic
- title: Editor
  type: code
  hostname: docker-vm
  path: /newrelic
difficulty: basic
timelimit: 600
---

🧪 Step 1: Setup applications
=======================

In the root workspace directory, run the `make` command.
It will generate `.env` files for your applications.

```
make
```

🧪 Step 2: Add your New Relic License Keys
=======================

Using the Editor tab, update the `.env` files to add your `NEW_RELIC_LICENSE_KEY` to each application.

- apps/web-api/.env
- apps/login-service/.env

.env file:
```
NEW_RELIC_LICENSE_KEY=AABBCC
```

🏁 Step 3: Finish
=========

- Verify that everything is working.

```
make up
```

- View the logs from the applications.

```
make logs
```

- Behind the scenes smoke tests are running to simulate load on your applications. In a few minutes, this data will appear in New Relic UI.

To complete the challenge, press **Check**
