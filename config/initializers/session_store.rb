if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_backend_api", domain: "eat-list-backend.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_backend_api"
end