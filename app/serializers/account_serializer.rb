class AccountSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :balance,
             :is_investment,
             :total_interest_earned,
             :growth_percentage,
             :created_at,
             :updated_at

  def total_interest_earned
    object.total_interest_earned
  end

  def growth_percentage
    object.growth_percentage
  end
end