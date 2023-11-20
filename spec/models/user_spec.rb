# frozen_string_literal: true

require 'rails_helper'

describe User do
  describe '#name' do
    it 'returns the full name of the user' do
      user = build(:user, first_name: 'John', last_name: 'Doe')
      expect(user.name).to eq('John Doe')
    end
  end

  describe '#auth_provider' do
    context 'when provider is google_oauth2' do
      it 'returns Google' do
        user = build(:user, provider: :google_oauth2)
        expect(user.auth_provider).to eq('Google')
      end
    end

    context 'when provider is github' do
      it 'returns Github' do
        user = build(:user, provider: :github)
        expect(user.auth_provider).to eq('Github')
      end
    end
  end

  describe '.find_google_user' do
    it 'finds a user with a Google provider and specific uid' do
      created_user = create(:user, uid: '12345')
      found_user = described_class.find_google_user('12345')
      expect(found_user).to eq(created_user)
    end
  end

  describe '.find_github_user' do
    it 'finds a user with a Github provider and specific uid' do
      created_user = create(:user, provider: :github, uid: '12345')
      found_user = described_class.find_github_user('12345')
      expect(found_user).to eq(created_user)
    end
  end
end
