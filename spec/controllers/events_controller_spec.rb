# frozen_string_literal: true

require 'rails_helper'

describe EventsController do
  let(:state) { create(:state, symbol: 'CA') }
  let(:county) { create(:county, state: state) }
  let!(:event) { create(:event, county: county) }

  describe 'GET #index' do
    context 'without filters' do
      it 'assigns all events to @events' do
        get :index
        expect(assigns(:events)).to match_array([event])
      end
    end

    context 'with state-only filter' do
      it 'assigns events from the specified state to @events' do
        get :index, params: { 'filter-by' => 'state-only', 'state' => state.symbol }
        expect(assigns(:events)).to match_array([event])
      end
    end

    context 'with county filter' do
      it 'assigns events from the specified county to @events' do
        get :index, params: { 'filter-by' => 'county', 'state' => state.symbol, 'county' => county.fips_code }
        expect(assigns(:events)).to match_array([event])
      end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested event to @event' do
      get :show, params: { id: event.id }
      expect(assigns(:event)).to eq(event)
    end
  end
end
