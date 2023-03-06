require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Licon
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.assets.enabled = false
    config.action_cable.mount_path = "/cable"
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::ContentSecurityPolicy::Middleware
    config.action_dispatch.cookies_same_site_protection = :strict
    config.ssl_options = { hsts: { preload: true } }
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
