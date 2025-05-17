class BudgetSerializer < ActiveModel::Serializer
  attributes :id, :category_id, :amount, :month
  belongs_to :category #5
end
