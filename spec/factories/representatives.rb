# frozen_string_literal: true

FactoryBot.define do
  factory :representative do
    name { 'John Doe' }
    ocdid { 'ocd-division/country:us/state:example' }
    title { 'Position Title' }
    street { '123 Main St' }
    city { 'Anytown' }
    state { 'State' }
    zip { '12345' }
    party { 'Political Party' }
    photo_url { 'https://example.com/photo.jpg' }
  end
end
