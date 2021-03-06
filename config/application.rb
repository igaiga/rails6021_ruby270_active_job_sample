require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rails6021Ruby270ActiveJobSample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.eager_load_paths << "app/workers"

    config.active_job.queue_adapter = :sidekiq
    # zconfig.active_job.queue_adapter = :async # default
    # config.active_job.queue_adapter = :inline
    # Rails.application.config.active_job.queue_adapter = :inline

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
