# frozen_string_literal: true

class User < ApplicationRecord
  DEVISE_BEHAVIORS = %i[
    confirmable
    database_authenticatable
    recoverable
    registerable
    rememberable
    trackable
    validatable
  ].freeze

  devise(*DEVISE_BEHAVIORS)
end
