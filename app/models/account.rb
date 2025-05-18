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

    def interest_transactions
        transactions.where(description: 'Monthly Interest', transaction_type: 'income')
    end

    def total_interest_earned
        interest_transactions.sum(:amount)
    end

    def current_value
        balance + total_interest_earned
    end

    def growth_percentage
        return 0 if initial_amount.zero?
        ((total_interest_earned / balance) * 100).round(2)
    end

    
end
