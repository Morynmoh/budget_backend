class Account < ApplicationRecord
  belongs_to :user
    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy
    has_many :investments, dependent: :destroy
    has_many :outgoing_transactions, class_name: 'Transaction', foreign_key: 'from_account_id', dependent: :destroy
    has_many :incoming_transactions, class_name: 'Transaction', foreign_key: 'to_account_id', dependent: :destroy
end
