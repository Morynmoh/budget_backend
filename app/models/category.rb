class Category < ApplicationRecord
  has_many :expenses
  has_many :budgets
end