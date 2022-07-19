require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { users(:first_user) }

  before do
    sign_in(user)
  end

  describe 'POST #create' do
    it 'create account' do

      params = {
        account: {
          balance: '40'
        }
      }

      post :create, xhr: true, params: params, format: :html

      expect(response.code).to eq('200')

      user.reload
      expect(user.account).to eq(Account.last)
    end
  end

  describe 'GET #show' do
    it 'show account' do
      get :show, xhr: true, format: :html

      expect(response.code).to eq('200')
    end
  end
end
