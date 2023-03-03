
# Output the names of the apps we are going to monitor
output "o11y-as-code-apps" {
    value = toset(var.APPS)
}

# 
# Dashboards
# 

# https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/one_dashboard_json
# resource "newrelic_one_dashboard_json" "imported-dashboard" {
#    json = file("dashboards/node.json")
# }

# output "newrelic_one_dashboard" {
#   value = newrelic_one_dashboard_json.imported-dashboard.permalink
# }

# 
# Tagging Applications
# 

# data "newrelic_entity" "APPS" {
#   count = length(var.APPS)
#   name  = var.APPS[count.index]
#   type = "APPLICATION"
#   domain = "APM"
# }

# resource to create, update, and delete tags for a New Relic entity.
# resource "newrelic_entity_tags" "APPS" {
#     guid = data.newrelic_entity.APPS[count.index].guid
#     count = length(var.APPS)

#     # A nested block that describes an entity tag
#     tag {
#         key = "Team"
#         values = ["O11yDayMiami", "Terraform"]
#     }

#     tag {
#         key = "Env"
#         values = ["Staging"]
#     }
# }


# 
# Workloads
# 

# https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/workload
# resource "newrelic_workload" "O11yAsCode" {
#     name = "O11yAsCode Workload (TF)"
#     account_id = (var.NEW_RELIC_ACCOUNT_ID)

#     # Include entities with a set of tags.
#     entity_search_query {
#         query = "tags.Team='O11yDayMiami'"
#     }
# }

# output "newrelic_workload" {
#   value = newrelic_workload.O11yAsCode.permalink
# }


# 
# Alerts, Workflows and Notifications
#

# resource to create, update, and delete alerts in New Relic
# resource "newrelic_alert_policy" "alert_policies" {
#   name = "O11yAsCode-${var.APPS[count.index]} (TF)"
#   count = length(var.APPS)
#   incident_preference = "PER_CONDITION"
# }

# NRQL alert condition - Latency (static)
# resource "newrelic_nrql_alert_condition" "GoldenSignals-Latency" {
#   count              = length(var.APPS)
#   policy_id          = newrelic_alert_policy.alert_policies[count.index].id

#   type               = "static"
#   name               = "GoldenSignals-Latency"
#   description        = "Alert when Latency transactions are taking too long"
#   runbook_url        = "https://www.example.com"
#   enabled            = true
#   aggregation_method = "event_flow"
#   aggregation_delay  = 60

#   nrql {
#     query = "SELECT average(apm.service.overview.web) * 1000 FROM Metric WHERE appName like '%${var.APPS[count.index]}%'"
#   }

#   critical {
#     operator              = "above"
#     threshold             = 80
#     threshold_duration    = 60
#     threshold_occurrences = "at_least_once"
#   }

#   warning {
#     operator              = "above"
#     threshold             = 40
#     threshold_duration    = 60
#     threshold_occurrences = "at_least_once"
#   }
# }

# NRQL alert condition - Errors (static)
# resource "newrelic_nrql_alert_condition" "GoldenSignals-Errors" {
#   count              = length(var.APPS)
#   policy_id          = newrelic_alert_policy.alert_policies[count.index].id

#   type               = "static"
#   name               = "GoldenSignals-Errors"
#   description        = "Alert when Errors are too high"
#   runbook_url        = "https://www.example.com"
#   enabled            = true
#   aggregation_method = "event_flow"
#   aggregation_delay  = 60

#   nrql {
#     query = "SELECT (count(apm.service.error.count) / count(apm.service.transaction.duration))*100 FROM Metric WHERE (appName like '%${var.APPS[count.index]}%') AND (transactionType = 'Web')"
#   }

#   critical {
#     operator              = "above"
#     threshold             = 2
#     threshold_duration    = 60
#     threshold_occurrences = "at_least_once"
#   }

#   warning {
#     operator              = "above"
#     threshold             = 1
#     threshold_duration    = 60
#     threshold_occurrences = "at_least_once"
#   }
# }

# NRQL alert condition - Traffic (baseline)
# resource "newrelic_nrql_alert_condition" "GoldenSignals-Traffic" {
#   count              = length(var.APPS)
#   policy_id          = newrelic_alert_policy.alert_policies[count.index].id

#   type               = "baseline"
#   name               = "GoldenSignals-Traffic"
#   description        = "Alert when Traffic transactions are odd"
#   runbook_url        = "https://www.example.com"
#   enabled            = true
#   aggregation_method = "event_flow"
#   aggregation_delay  = 60

#   # baseline type only
#   baseline_direction = "upper_only"

#   nrql {
#     query = "SELECT rate(count(apm.service.transaction.duration), 1 minute) FROM Metric WHERE (appName LIKE '%${var.APPS[count.index]}%') AND (transactionType = 'Web')"
#   }

#   critical {
#     operator              = "above"
#     threshold             = 4
#     threshold_duration    = 180
#     threshold_occurrences = "at_least_once"
#   }

#   warning {
#     operator              = "above"
#     threshold             = 3
#     threshold_duration    = 120
#     threshold_occurrences = "at_least_once"
#   }
# }

# NRQL alert condition - Saturation (static)
# resource "newrelic_nrql_alert_condition" "GoldenSignals-Saturation" {
#   count              = length(var.APPS)
#   policy_id          = newrelic_alert_policy.alert_policies[count.index].id

#   type               = "static"
#   name               = "GoldenSignals-Saturation"
#   description        = "Alert when Saturation is high"
#   runbook_url        = "https://www.example.com"
#   enabled            = true
#   aggregation_method = "event_flow"
#   aggregation_delay  = 60

#   nrql {
#     query = "SELECT average(apm.service.memory.physical) * rate(count(apm.service.instance.count), 1 minute) / 1000 FROM Metric WHERE appName LIKE '%${var.APPS[count.index]}%'"
#   }

#   critical {
#     operator              = "above"
#     threshold             = 20
#     threshold_duration    = 60
#     threshold_occurrences = "at_least_once"
#   }

#   warning {
#     operator              = "above"
#     threshold             = 10
#     threshold_duration    = 60
#     threshold_occurrences = "at_least_once"
#   }
# }

#  resource to create and manage New Relic workflows
# resource "newrelic_workflow" "Workflow" {
#   for_each           = toset(var.APPS)

#   name                  = "Workflow ${each.key} (TF)"
#   account_id            = var.NEW_RELIC_ACCOUNT_ID
#   muting_rules_handling = "NOTIFY_ALL_ISSUES"
#   issues_filter {
#     name = "Filter-name"
#     type = "FILTER"

#     predicate {
#       attribute = "accumulations.policyName"
#       operator  = "CONTAINS"
#       values    = ["O11yAsCode-${each.key}"]
#     }
#   }
#   destination {
#     channel_id = newrelic_notification_channel.alert_notification_email.id
#   }
# }

# resource to create and manage New Relic notification destinations
# resource "newrelic_notification_destination" "alert_email_destination" {
#   name = "email"
#   type = "EMAIL"

#   property {
#     key   = "email"
#     value = var.ALERT_NOTIFICATION_EMAIL
#   }
# }

# resource to create and manage New Relic notification channels
# resource "newrelic_notification_channel" "alert_notification_email" {
#   account_id     = var.NEW_RELIC_ACCOUNT_ID
#   name           = "email"
#   type           = "EMAIL"
#   destination_id = newrelic_notification_destination.alert_email_destination.id
#   product        = "IINT"

#   property {
#     key   = "subject"
#     value = "name: {{ alert_notification_email }}"
#   }
# }



# 
# Synthetics monitor - Simple Browser
# 

# resource to create, update, and delete a synthetics monitor in New Relic.
# resource "newrelic_synthetics_monitor" "O11yAsCode-SimpleBrowser-TF" {
#   # The human-readable identifier for the monitor.
#   name = "O11yAsCode-SimpleBrowser-TF"
#   # The monitor type. Valid values are SIMPLE and BROWSER.
#   type = "BROWSER"

#   # The interval (in minutes) at which this monitor should run.
#   period = "EVERY_30_MINUTES"
#   # The run state of the monitor.
#   status = "ENABLED"

#   # Public minion location
#   # https://docs.newrelic.com/docs/synthetics/synthetic-monitoring/administration/synthetic-public-minion-ips/#location
#   locations_public = ["AP_SOUTHEAST_2", "AP_SOUTHEAST_1", "AP_SOUTH_1", "AP_NORTHEAST_1", "AP_NORTHEAST_2"]

#   # The URI the monitor runs against.
#   uri = (var.SYNTHETIC_MONITOR_URL)
# }