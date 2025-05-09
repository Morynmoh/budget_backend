class IncomeSerializer < ActiveModel::Serializer
  attributes :id, :account_id, :amount, :date, :source
  belongs_to :account
end
