class UpdateAccountsPrecisionAndDefaults < ActiveRecord::Migration[8.0]
  def change
    change_column :accounts, :balance, :decimal, precision: 15, scale: 2, default: 0.0
  end
end
