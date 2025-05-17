class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :update, :destroy]

  def index
    @transfers = Transfer.all
    render json: @transfers
  end

  def show
    render json: @transfer
  end

  def create
    @transfer = Transfer.new(transfer_params)
    if @transfer.save
      render json: @transfer, status: :created
    else
      render json: @transfer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @transfer.update(transfer_params)
      render json: @transfer
    else
      render json: @transfer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @transfer.destroy
    head :no_content
  end

  def by_account
    @transfers = Transfer.where("from_account_id = ? OR to_account_id = ?", 
                              params[:account_id], params[:account_id])
    render json: @transfers
  end

  private

  def set_transfer
    @transfer = Transfer.find(params[:id])
  end

  def transfer_params
    params.require(:transfer).permit(:from_account_id, :to_account_id, :amount, :description, :date)
  end
end 