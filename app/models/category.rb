class Category < ApplicationRecord
  has_many :expenses
  has_many :budgets

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :monthly_budget, numericality: { greater_than_or_equal_to: 0 }
end