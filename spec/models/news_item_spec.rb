# frozen_string_literal: true

require 'rails_helper'

describe NewsItem do
  describe '.find_for' do
    let(:representative) { create(:representative) }
    let!(:news_item) { create(:news_item, representative: representative) }

    context 'when the representative has a news item' do
      it 'returns the news item for the given representative' do
        expect(described_class.find_for(representative.id)).to eq(news_item)
      end
    end

    context 'when the representative has no news items' do
      it 'returns nil' do
        other_representative = create(:representative)
        expect(described_class.find_for(other_representative.id)).to be_nil
      end
    end
  end
end
