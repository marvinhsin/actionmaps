# frozen_string_literal: true

require 'rails_helper'

describe MyNewsItemsController do
  let(:representative) { create(:representative) }
  let(:news_item) { create(:news_item, representative: representative) }

  before do
    session[:current_user_id] = create(:user).id
  end

  describe 'GET #new' do
    it 'assigns a new news_item' do
      get :new, params: { representative_id: representative.id }
      expect(assigns(:news_item)).to be_a_new(NewsItem)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested news_item' do
      get :edit, params: { id: news_item.id, representative_id: representative.id }
      expect(assigns(:news_item)).to eq(news_item)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:news_item_params) { attributes_for(:news_item).merge(representative_id: representative.id) }

      it 'creates a new NewsItem' do
        expect do
          post :create, params: { news_item: news_item_params, representative_id: representative.id }
        end.to change(NewsItem, :count).by(1)
      end
    end
  end

  describe 'PATCH #update' do
    let(:new_attributes) { { title: 'Updated Title' } }
    let(:perform_request) do
      patch :update, params: {
        id:                news_item.id,
        news_item:         new_attributes,
        representative_id: representative.id
      }
    end

    it 'updates the requested news_item' do
      perform_request
      news_item.reload
      expect(news_item.title).to eq('Updated Title')
    end
  end
end
