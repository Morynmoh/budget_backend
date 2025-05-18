class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    render json: @accounts
  end

  def show
    account = Account.find_by(id: params[:id])
    if account
      render json: account
    else
      render json: { error: 'Account not found' }, status: :not_found
    end
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    account = Account.find_by(id: params[:id])

    if account
      if account.update(account_params)
        render json: { message: 'Account updated successfully', account: account }, status: :ok
      else
        render json: { error: 'Failed to update account', details: account.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Account not found' }, status: :not_found
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

  def account_params
    params.require(:account).permit(:name, :balance, :is_investment)
  end
end



# class AccountsController < ApplicationController
#   def index
#     @accounts = Account.all
#     render json: @accounts
#   end

#   def show
#     render json: @account
#   end

#   def create
#     account_params = params.require(:account).permit(:name, :balance)
#     @account = Account.new(account_params)

#     if @account.save
#       render json: @account, status: :created
#     else
#       render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
#     end
#   end

#   def update
#     account = Account.find_by(id: params[:id])

#     if account
#       if account.update(account_params) # Using strong parameters to whitelist allowed fields
#         render json: { message: 'Account updated successfully', account: account }, status: :ok
#       else
#         render json: { error: 'Failed to update account', details: account.errors.full_messages }, status: :unprocessable_entity
#       end
#     else
#       render json: { error: 'Account not found' }, status: :not_found
#     end
#   end

#   def destroy
#     account = Account.find_by(id: params[:id])

#     if account
#       account.destroy
#       render json: { message: 'Account deleted successfully' }, status: :ok
#     else
#       render json: { error: 'Account not found' }, status: :not_found
#     end
#   end

#   private

#   def set_account
#     @account = Account.find(params[:id])
#   end

#   def account_params
#     params.require(:account).permit(:name, :balance, :is_investment)
#   end
# end
