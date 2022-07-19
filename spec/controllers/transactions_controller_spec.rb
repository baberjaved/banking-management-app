require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) { users(:first_user) }

  before do
    sign_in(user)
  end

  describe 'POST #create' do
    it 'create transaction' do
      user = users(:first_user)
      second_user = users(:second_user)
      account = user.account
      old_balance = account.balance

      params = {
        account_id: user.account.id,
        user: second_user.id,
        transaction: {
          amount: "10"
        }
      }

      post :create, xhr: true, params: params, format: :html

      expect(response.code).to eq('200')

      account.reload
      expect(account.balance).to eq(old_balance - account.transactions_from.last.amount)
    end
  end
end
