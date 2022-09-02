# frozen_string_literal: true

require_relative 'boot'

require 'rails'

%w[
  active_record/railtie
  active_storage/engine
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  action_text/engine
  rails/test_unit/railtie
].each do |railtie|
  require railtie
rescue LoadError
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.i18n.available_locales = %i[en ru]
    config.i18n.default_locale = :ru
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.active_record.default_timezone = 'Moscow'
    config.time_zone = 'Moscow'
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
