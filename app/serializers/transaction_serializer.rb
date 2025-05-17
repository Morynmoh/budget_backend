class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :description, :date, :transaction_type
  
  belongs_to :account
  belongs_to :category, optional: true
end 