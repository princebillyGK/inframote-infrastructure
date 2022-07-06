provider "heroku" {
  email   = var.heroku.email
  api_key = var.heroku.api_key
}

// Environment variables
resource "heroku_config" "inframote_env" {
    sensitive_vars = {
      SECRET_TOKEN = var.app_conf.secret_key
      PAGE_ACCESS_TOKEN = var.app_conf.page_access_token
    }
}

resource "heroku_app" "inframote_app" {
  name   = local.app.name
  region = "us"
}


// Assigning env variables
resource "heroku_app_config_association" "inframote_conf_assoc" {
  app_id = heroku_app.inframote_app.id

  vars = heroku_config.inframote_env.vars
  sensitive_vars = heroku_config.inframote_env.sensitive_vars
}

# # Build code & release to the app
# resource "heroku_build" "inframote_build" {
#   app_id     = heroku_app.inframote_app.id
#   source {
#     url     = "https://github.com/inframotebot/chatbot/archive/refs/tags/Dev.tar.gz"
#   }
# }

# # Launch the app's web process by scaling-up
# resource "heroku_formation" "inframote_formation" {
#   app_id     = heroku_app.inframote_app.id
#   type       = "web"
#   quantity   = 1
#   size       = "Free"
# }

output "inframote_app_url" {
  value = heroku_app.inframote_app.web_url
}
output "inframote_app_git" {
  value = heroku_app.inframote_app.git_url
}
