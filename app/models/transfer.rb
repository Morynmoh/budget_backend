class Transfer < ApplicationRecord
  belongs_to :from_account, class_name: 'Account'
  belongs_to :to_account, class_name: 'Account'

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :from_account_id, presence: true
  validates :to_account_id, presence: true
  validate :different_accounts
  validate :sufficient_balance

  after_create :process_transfer
  before_destroy :revert_transfer

  private

  def different_accounts
    if from_account_id == to_account_id
      errors.add(:base, "Cannot transfer to the same account")
    end
  end

  def sufficient_balance
    if from_account && amount && from_account.balance < amount
      errors.add(:amount, "Insufficient balance in source account")
    end
  end

  def process_transfer
    Transfer.transaction do
      from_account.update_column(:balance, from_account.balance - amount)
      to_account.update_column(:balance, to_account.balance + amount)
    end
  end

  def revert_transfer
    Transfer.transaction do
      from_account.update_column(:balance, from_account.balance + amount)
      to_account.update_column(:balance, to_account.balance - amount)
    end
  end
end
