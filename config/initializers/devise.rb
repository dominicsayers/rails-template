# frozen_string_literal: true

Devise.setup do |config|
  require 'devise/orm/active_record'

  config.allow_unconfirmed_access_for = 2.days
  config.case_insensitive_keys = [:email]
  config.confirm_within = 3.days
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.expire_all_remember_me_on_sign_out = true
  config.mailer_sender = ENV['DEVISE_MAILER_SENDER']
  config.password_length = 6..4096
  config.pepper = ENV['DEVISE_PEPPER']
  config.reconfirmable = true
  config.reset_password_within = 6.hours
  config.secret_key = ENV['DEVISE_SECRET_KEY']
  config.send_email_changed_notification = true
  config.send_password_change_notification = true
  config.sign_out_via = :delete
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.strip_whitespace_keys = [:email]
end
