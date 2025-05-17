class Account < ApplicationRecord

    has_many :expenses, dependent: :destroy
    has_many :incomes, dependent: :destroy
    has_many :transactions, dependent: :destroy
    has_many :investments, dependent: :destroy
    has_many :outgoing_transfers, class_name: 'Transfer', foreign_key: 'from_account_id', dependent: :destroy
    has_many :incoming_transfers, class_name: 'Transfer', foreign_key: 'to_account_id', dependent: :destroy
    # has_many :outgoing_transactions, class_name: 'Transaction', foreign_key: 'from_account_id', dependent: :destroy
    # has_many :incoming_transactions, class_name: 'Transaction', foreign_key: 'to_account_id', dependent: :destroy

    validates :name, presence: true
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
