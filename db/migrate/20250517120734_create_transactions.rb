class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.string :transaction_type
      t.decimal :amount, precision: 15, scale: 2
      t.string :description
      t.date :date

      t.timestamps
    end
  end
end
