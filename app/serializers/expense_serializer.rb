class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :account_id, :category_id, :amount, :date, :description
  belongs_to :account
  belongs_to :category
end
