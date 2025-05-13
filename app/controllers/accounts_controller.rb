class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    render json: @accounts
  end

  def show
    render json: @aacount
  end

  def create
    account_params = params.require(:account).permit(:name, :balance)
    @account = Account.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def destroy
    account = Account.find_by(id: params[:id])

    if account
      account.destroy
      render json: { message: 'Account deleted successfully' }, status: :ok
    else
      render json: { error: 'Account not found' }, status: :not_found
    end
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :balance)
  end
end
