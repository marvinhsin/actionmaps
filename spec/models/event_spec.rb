# frozen_string_literal: true

require 'rails_helper'

describe Event do
  describe 'validations' do
    it 'is valid with valid attributes' do
      event = build(:event)
      expect(event).to be_valid
    end

    it 'is not valid without a start time' do
      event = build(:event, start_time: nil)
      expect(event).not_to be_valid
    end

    it 'is not valid without an end time' do
      event = build(:event, end_time: nil)
      expect(event).not_to be_valid
    end

    it 'is not valid if start time is in the past' do
      event = build(:event, start_time: 1.day.ago)
      expect(event).not_to be_valid
    end

    it 'is not valid if end time is before start time' do
      event = build(:event, start_time: 1.day.from_now, end_time: 1.hour.from_now)
      expect(event).not_to be_valid
    end
  end

  describe '#county_names_by_id' do
    let(:state) { create(:state) }
    let(:county1) { create(:county, name: 'County One', state: state) }
    let(:county2) { create(:county, name: 'County Two', state: state) }
    let(:event) { create(:event, county: county1) }

    before do
      county2
    end

    it 'returns a hash of county names and IDs for the state of the event’s county' do
      expect(event.county_names_by_id).to eq({
                                               'County One' => county1.id,
                                               'County Two' => county2.id
                                             })
    end
  end
end
