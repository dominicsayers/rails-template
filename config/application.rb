# frozen_string_literal: true

require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
Bundler.require(*Rails.groups)

module RailsTemplate
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators.system_tests = nil

    config.application_name = parent_name
    config.application_slug = config.application_name.underscore
    config.application_title = config.application_slug.humanize
  end
end
