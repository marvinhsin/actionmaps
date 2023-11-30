# frozen_string_literal: true

class CampaignFinance < ApplicationRecord
  def self.top_20_candidates(cycle, category)
    api_key = '9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA'

    conn = Faraday.new do |faraday|
      faraday.url_prefix = 'https://api.propublica.org/campaign-finance/v1/'
      faraday.headers['X-API-Key'] = api_key
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("#{cycle}/candidates/leaders/#{category}.json")
    parsed_data = JSON.parse(response.body)
    # parsed_data['results']
    candidates = parsed_data['results']
    top_20_candidates = candidates&.first(20)
    Rails.logger.info("Category: #{category}")
    top_20_candidates || []
  end
end
