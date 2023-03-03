# your unique New Relic account ID 
variable "NEW_RELIC_ACCOUNT_ID" {
  default = "XXXXX"
}

# your User API key
variable "NEW_RELIC_API_KEY" {
  default = "XXXXX"
}

# valid regions are US and EU
variable "NEW_RELIC_REGION" {
  default = "US"
}

variable "APPS" {
  description = "Apps to deploy"
  type        = list(string)
  default     = ["web-api", "login-service"]
}

# email address to send alert notifications
variable "ALERT_NOTIFICATION_EMAIL" {
  default = "XXXXX"
}

# the URL the monitor runs against.
variable "SYNTHETIC_MONITOR_URL" {
  default = "http://example.com"
}