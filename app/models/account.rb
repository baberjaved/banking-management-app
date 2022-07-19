class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions_from, class_name: 'Transaction', foreign_key: :account_from_id
  has_many :transactions_to, class_name: 'Transaction', foreign_key: :account_to_id

  validates :balance, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def transfer_amount(params)
    params_amount = params.dig('transaction', 'amount').to_i
    return false if balance < params_amount

    user = User.find_by(id: params[:user])
    account_to = user.account

    return false if account_to.nil?

    update(balance: balance - params_amount)
    account_to.update(balance: account_to.balance + params_amount)
    transactions_from.create!(account_to_id: account_to.id, amount: params_amount)
  end
end
