# frozen_string_literal: true

FactoryBot.define do
  factory :county do
    name { 'San Francisco' }
    fips_code { 12 }
    fips_class { 'H1' }
    association :state
  end
end
