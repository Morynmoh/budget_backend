class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category, optional: true

  validates :amount, presence: true, numericality: true
  validates :date, presence: true
  validates :transaction_type, presence: true, inclusion: { in: %w[income expense], message: "%{value} is not a valid transaction type" }
  validates :account_id, presence: true

  after_save :update_account_balance
  before_destroy :revert_account_balance

  private

  def update_account_balance
    multiplier = (transaction_type == 'expense') ? -1 : 1
    account.update_column(:balance, account.balance + (amount * multiplier))
  end

  def revert_account_balance
    multiplier = (transaction_type == 'expense') ? 1 : -1
    account.update_column(:balance, account.balance + (amount * multiplier))
  end
end

