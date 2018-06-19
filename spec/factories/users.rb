# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'aa@bb.com' }
    password { 'password' }
  end
end
