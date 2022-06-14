variable "heroku" {
  type = object({
    email = string
    api_key = string
  })
  sensitive = true
}

variable "app_conf" {
  type = object({
    secret_key = string
    page_access_token = string
  })
  sensitive = true
}
