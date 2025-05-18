class AddIsInvestmentToAccounts < ActiveRecord::Migration[8.0]
  def change
    add_column :accounts, :is_investment, :boolean
  end
end
