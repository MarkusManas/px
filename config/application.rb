require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Projectx
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    RailsAdmin.config do |config|
      config.authorize_with do 
        if current_user.nil?
          redirect_to main_app.root_path
        else
          redirect_to main_app.root_path unless current_user.role == 'super_admin'
        end
      end
    end
  end
end
