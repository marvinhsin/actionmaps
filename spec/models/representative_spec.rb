# frozen_string_literal: true

require 'rails_helper'

describe Representative do
  describe 'civic_api_to_representative_params' do
    let!(:existing_rep) do
      described_class.create!(
        name:      'Taylor Swift',
        ocdid:     '123',
        title:     'Senator',
        street:    '1021 O Street',
        city:      'Sacramento',
        state:     'CA',
        zip:       '95814',
        party:     'Democrat',
        photo_url: 'http://example.com/taylor_swift.jpg'
      )
    end
    let(:address) { OpenStruct.new(line1: '1021 O Street', city: 'Sacramento', state: 'CA', zip: '95814') }
    let(:official) do
      OpenStruct.new(
        name:      'Taylor Swift',
        address:   [address],
        party:     'Democrat',
        photo_url: 'http://example.com/taylor_swift.jpg'
      )
    end
    let(:office) { OpenStruct.new(name: 'Senator', division_id: '123', official_indices: [0]) }
    let(:rep_info) { OpenStruct.new(officials: [official], offices: [office]) }

    after do
      DatabaseCleaner.clean
    end

    it 'does not add an additional record for an existing representative' do
      described_class.civic_api_to_representative_params(rep_info)

      expect(described_class.count).to eq(1)
      expect(described_class.last).to eq(existing_rep)
    end
  end
end
