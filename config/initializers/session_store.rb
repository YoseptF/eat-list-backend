if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_backend_api", domain: "my-eat-list-backend.herokuapp.com", same_site: :none, secure: :true
else
  Rails.application.config.session_store :cookie_store, key: "_backend_api"
end