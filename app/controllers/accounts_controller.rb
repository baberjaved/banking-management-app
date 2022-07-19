class AccountsController < ApplicationController
  def index
  end

  def new
    @account = current_user.build_account
  end

  def create
    @account = current_user.build_account(account_params)

    redirect_to root_path if @account.save
  end

  def show
    @account = current_user.account
    @transactions_from = @account&.transactions_from
    @transactions_to = @account&.transactions_to
  end

  private

  def account_params
    params.require(:account).permit(:balance)
  end
end
