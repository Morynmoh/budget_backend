class TransferSerializer < ActiveModel::Serializer
  attributes :id, :amount, :description, :date
  
  belongs_to :from_account
  belongs_to :to_account
end 