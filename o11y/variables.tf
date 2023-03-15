# your unique New Relic account ID 
variable "NEW_RELIC_ACCOUNT_ID" {
  default = "1234567"
}

# your User API key, starting with "NRAK-"
variable "NEW_RELIC_API_KEY" {
  default = "NRAK-XXXXX"
  sensitive = true
}

# valid regions are US and EU
variable "NEW_RELIC_REGION" {
  default = "US"
}

# List of apps to monitor
variable "APPS" {
  description = "Apps to deploy"
  type        = list(string)
  default     = ["web-api", "login-service"]
}

# Tags to apply to the apps
variable "TAGS" {
  description = "My Team Tags"
  type = map(string)
  default = {
    team = "FutureStackSaoPaulo"
    env  = "staging"
  }
}

# The name of your team workload
variable "MY_TEAM_WORKLOAD_NAME" {
  default = "O11yAsCode Sao Paolo (TF)"
}

variable "MY_TEAM_WORKLOAD_QUERY" {
  default = "tags.Team='FutureStackSaoPaulo'"
}

# List of URLs to run checks against.
variable "SYNTHETIC_CHECK_SSL_URLS" {
  description = "URLS to check for synthetic checks"
  type        = list(string)
  default = ["https://example.com", "https://amce.com"]
}

variable "SYNTHETIC_CHECK_BROKEN_LINKS" {
  description = "URLS to check for synthetic checks"
  type        = list(string)
  default = ["https://example.com", "https://amce.com"]
}

# Your email address send alert notifications
variable "ALERT_NOTIFICATION_EMAIL" {
  default = "XXXXX"
}

variable "ALERT_LATENCY" {
  default = {
    type = "baseline"
    description = "Alert when transactions are taking too long"
    enabled = true
    violation_time_limit_seconds = 3600
    aggregation_method = "event_flow"
    aggregation_delay = 60
    slide_by = 30
    baseline_direction = "upper_only"
    query = "SELECT average(apm.service.overview.web) * 1000 FROM Metric WHERE appName = '__APP_NAME__'"
    
    critical_operator               = "above"
    critical_threshold              = 5.5
    critical_threshold_duration     = 300
    critical_threshold_occurrences  = "all"
    
    warning_operator                = "above"
    warning_threshold               = 3.5
    warning_threshold_duration      = 600
    warning_threshold_occurrences   = "all"
  }
}

variable "ALERT_ERROR_RATE" {
  default = {
    type = "baseline"
    description = "Alert when transactions are taking too long"
    enabled = true
    violation_time_limit_seconds = 3600
    aggregation_method = "event_flow"
    aggregation_delay = 120
    slide_by = 30
    baseline_direction = "upper_only"
    query = "SELECT percentile(duration, 95) FROM Transaction WHERE appName = '__APP_NAME__'"
    
    critical_operator               = "above"
    critical_threshold              = 4
    critical_threshold_duration     = 600
    critical_threshold_occurrences  = "at_least_once"
    
    warning_operator                = "above"
    warning_threshold               = 2
    warning_threshold_duration      = 600
    warning_threshold_occurrences   = "at_least_once"
  }
}

variable "ALERT_TRAFFIC" {
  default = {
    type = "baseline"
    description = "Alert when traffic patterns diverge from baseline"
    enabled = true
    violation_time_limit_seconds = 3600
    aggregation_method = "event_flow"
    aggregation_delay = 120
    slide_by = 30
    baseline_direction = "upper_only"
    query = "SELECT rate(count(apm.service.transaction.duration), 1 minute) FROM Metric WHERE (appName = '__APP_NAME__') AND (transactionType = 'Web')"
    
    critical_operator               = "above"
    critical_threshold              = 4
    critical_threshold_duration     = 180
    critical_threshold_occurrences  = "at_least_once"
    
    warning_operator                = "above"
    warning_threshold               = 3
    warning_threshold_duration      = 120
    warning_threshold_occurrences   = "at_least_once"
  }
}

variable "ALERT_SATURATION" {
  default = {
    type = "baseline"
    description = "Alert when memory spikes above baseline"
    enabled = true
    violation_time_limit_seconds = 3600
    aggregation_method = "event_flow"
    aggregation_delay = 60
    slide_by = 30
    baseline_direction = "upper_only"
    query = "SELECT average(apm.service.memory.physical) * rate(count(apm.service.instance.count), 1 minute) / 1000 FROM Metric WHERE appName = '__APP_NAME__'"
    
    critical_operator               = "above"
    critical_threshold              = 20
    critical_threshold_duration     = 300
    critical_threshold_occurrences  = "at_least_once"
    
    warning_operator                = "above"
    warning_threshold               = 10
    warning_threshold_duration      = 120
    warning_threshold_occurrences   = "at_least_once"
  }
}