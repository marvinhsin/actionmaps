# frozen_string_literal: true

require 'rails_helper'

describe RepresentativesController do
  describe 'GET #show' do
    context 'when the representative exists' do
      let(:representative) { create(:representative) }

      it 'renders the show template' do
        get :show, params: { id: representative.id }
        expect(response).to render_template(:show)
      end
    end

    context 'when the representative does not exist' do
      it 'redirects to the representatives index with an alert' do
        get :show, params: { id: 99_999 }
        expect(response).to redirect_to(representatives_path)
        expect(flash[:alert]).to eq('Representative not found')
      end
    end
  end
end
