# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name  { 'Doe' }
    sequence(:uid) { |n| "UID#{n}" }
    provider { :google_oauth2 }
  end
end
