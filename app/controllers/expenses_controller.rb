class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :update, :destroy]

  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def show
    render json: @expense
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      render json: @expense, status: :created
    else
      render json: @expense.errors, status: :unprocessable_entity
    end
  end

  def update
    expense = Expense.find_by(id: params[:id])

    if expense
      if expense.update(expense_params) # Using strong parameters to whitelist allowed fields
        render json: { message: 'Expense updated successfully', expense: expense }, status: :ok
      else
        render json: { error: 'Failed to update expense', details: expense.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Expense not found' }, status: :not_found
    end
  end

  def destroy
    expense = Expense.find_by(id: params[:id])

    if expense
      expense.destroy
      render json: { message: 'Expense deleted successfully' }, status: :ok
    else
      render json: { error: 'Expense not found' }, status: :not_found
    end
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:account_id, :category_id, :amount, :date, :description)
  end
end