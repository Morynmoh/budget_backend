class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :update, :destroy]

  def index
    @investments = Investment.all
    render json: @investments
  end

  def show
    render json: @investment
  end

  def create
    @investment = Investment.new(investment_params)
    if @investment.save
      render json: @investment, status: :created
    else
      render json: @investment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @investment.update(investment_params)
      render json: @investment
    else
      render json: @investment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @investment.destroy
    head :no_content
  end

  private

  def set_investment
    @investment = Investment.find(params[:id])
  end

  def investment_params
    params.require(:investment).permit(:account_id, :amount, :investment_type, :date)
  end
end