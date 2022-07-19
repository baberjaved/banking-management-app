class TransactionsController < ApplicationController
  before_action :set_account

  def index; end

  def new
    @transaction = Transaction.new
    @users = User.all_with_valid_accounts_except(current_user)
  end

  def create
    @account.transfer_amount(params)

    redirect_to root_path
  end

  private

  def set_account
    @account = Account.find_by(id: params[:account_id])
  end

  def set_user_account
    @user = User.find_by(id: params[:user])
    @account_to = @user.account
  end
end
