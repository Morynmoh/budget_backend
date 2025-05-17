class CreateTransfers < ActiveRecord::Migration[8.0]
  def change
    create_table :transfers do |t|
      t.references :from_account, foreign_key: { to_table: :accounts }
      t.references :to_account, foreign_key: { to_table: :accounts }
      t.decimal :amount, precision: 15, scale: 2
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
