# frozen_string_literal: true

FactoryBot.define do
  factory :news_item do
    title { 'News Title' }
    link { 'https://example.com/news-item' }
    description { 'Description of the news item.' }
    issue { 'Climate Change' }
    representative
  end
end
