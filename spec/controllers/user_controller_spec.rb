# frozen_string_literal: true

require 'rails_helper'

describe UserController do
  describe 'GET #profile' do
    let(:user) { create(:user) }

    before do
      session[:current_user_id] = user.id
    end

    it 'assigns the current user to @user' do
      get :profile
      expect(assigns(:user)).to eq(user)
    end
  end
end
