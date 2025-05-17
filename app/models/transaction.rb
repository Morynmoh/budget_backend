class Transaction < ApplicationRecord
  belongs_to :account

  enum transaction_type: { income: 'income', expense: 'expense' }
end
