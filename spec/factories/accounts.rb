# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    sequence(:name) { |n| "Foo#{n}" }
    subdomain { name.downcase }
  end
end
