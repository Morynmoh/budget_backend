class InvestmentSerializer < ActiveModel::Serializer
  attributes :id, :account_id, :amount, :investment_type, :date
  belongs_to :account
end
