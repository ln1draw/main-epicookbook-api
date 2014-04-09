require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module MainEpicookbookAPI
  class Application < Rails::Application
    config.middleware.use Rack::Cors do
        allow do
            origins 'http://localhost:8000'
            resource '*', :headers => :any, :method => [:get, :options, :put, :patch, :destroy, :post]
        end
    end
  end
end