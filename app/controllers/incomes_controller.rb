class IncomesController < ApplicationController
  before_action :set_income, only: [:show, :update, :destroy]

  def index
    @incomes = Income.all
    render json: @incomes
  end

  def show
    render json: @income
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      render json: @income, status: :created
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  def update
    if @income.update(income_params)
      render json: @income
    else
      render json: @income.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @income.destroy
    head :no_content
  end

  private

  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:account_id, :amount, :date, :source)
  end
end

