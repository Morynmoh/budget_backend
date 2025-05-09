class Expense < ApplicationRecord
  belongs_to :account
  belongs_to :category

  after_create :deduct_from_account, :check_budget

  private

  def deduct_from_account
    account.update!(balance: account.balance - amount)
  end

  def check_budget
    monthly_budget = Budget.where(category: category).where("strftime('%Y-%m', month) = ?", date.strftime('%Y-%m')).first
    if monthly_budget && category.expenses.where("strftime('%Y-%m', date) = ?", date.strftime('%Y-%m')).sum(:amount) > monthly_budget.amount
      Rails.logger.info("Budget exceeded for category #{category.name}")
    end
  end
end
