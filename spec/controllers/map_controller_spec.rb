# frozen_string_literal: true

require 'rails_helper'

describe MapController do
  describe 'GET #index' do
    it 'assigns all states to @states' do
      states = create_list(:state, 3)
      get :index
      expect(assigns(:states)).to match_array(states)
    end
  end

  describe 'GET #state' do
    let(:state) { create(:state) }

    context 'when the state exists' do
      it 'assigns the state and its counties' do
        get :state, params: { state_symbol: state.symbol }
        expect(assigns(:state)).to eq(state)
      end
    end

    context 'when the state does not exist' do
      it 'redirects to the root path with an alert' do
        get :state, params: { state_symbol: 'XX' }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match("State 'XX' not found.")
      end
    end
  end

  describe 'GET #county' do
    let(:state) { create(:state) }
    let(:county) { create(:county, state: state) }

    context 'when the state and county exist' do
      it 'redirects to the search representatives path with county name' do
        get :county, params: { state_symbol: state.symbol, std_fips_code: county.std_fips_code }
        expect(response).to redirect_to(search_representatives_path(address: county.name))
      end
    end

    context 'when the county does not exist' do
      it 'redirects to the root path with an alert' do
        non_existent_fips_code = '9999'
        get :county, params: { state_symbol: state.symbol, std_fips_code: non_existent_fips_code }

        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to match("County with code '#{non_existent_fips_code}' not found for #{state.symbol}")
      end
    end
  end
end
