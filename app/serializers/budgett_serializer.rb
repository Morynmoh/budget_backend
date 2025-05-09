class BudgettSerializer < ActiveModel::Serializer
  attributes :id, :amount, :date, :description
  has_one :category
end
