# frozen_string_literal: true

require 'rails_helper'

describe State do
  describe '#std_fips_code' do
    context 'when FIPS code is less than 10' do
      it 'returns a two-digit FIPS code with leading zero' do
        state = create(:state, fips_code: 5)
        expect(state.std_fips_code).to eq('05')
      end
    end

    context 'when FIPS code is 10 or greater' do
      it 'returns a two-digit FIPS code as is' do
        state = create(:state, fips_code: 12)
        expect(state.std_fips_code).to eq('12')
      end
    end
  end
end
