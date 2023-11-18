require 'rails_helper'

describe Representative do
  describe 'civic_api_to_representative_params' do
    after do
      DatabaseCleaner.clean
    end

    it 'does not add an addition record for an existing representative' do
	existing_rep = Representative.create!(name: 'Taylor Swift', ocdid: '123', title: 'Senator')
	rep_info = double('rep_info', officials: [double('official', name: 'Taylor Swift')], offices: [double('office', name: 'Senator', division_id: '123', official_indices: [0])])
	
	Representative.civic_api_to_representative_params(rep_info)
	expect(Representative.count).to eq(1)
    end
  end
end

