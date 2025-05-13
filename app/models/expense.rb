class Expense < ApplicationRecord
  belongs_to :account
  belongs_to :category

  before_create :deduct_from_account
  before_create :check_budget  # 👈 this is what calls the method below

  private

  def check_budget
    # Access the category associated with the expense
    if category.monthly_budget && amount > category.monthly_budget
      errors.add(:amount, "exceeds the monthly budget for this category")
      throw :abort  # prevents saving the record
    end
  end

  def deduct_from_account
    if account.balance < amount
      errors.add(:amount, "not enough balance in account")
      throw :abort
    else
      account.update!(balance: account.balance - amount)
    end
  end
end




# class Expense < ApplicationRecord
#   belongs_to :account
#   belongs_to :category

#   before_create :deduct_from_account
#   before_create :check_budget  # 👈 this is what calls the method below

#   private

#   def check_budget
#     # Access the category associated with the expense
#     if category.monthly_budget && amount > category.monthly_budget
#       errors.add(:amount, "exceeds the monthly budget for this category")
#       throw :abort  # prevents saving the record
#     end
#   end

#   def deduct_from_account
#     if account.balance < amount
#       errors.add(:amount, "not enough balance in account")
#       throw :abort
#     else
#       account.update!(balance: account.balance - amount)
#     end
#   end
# end

