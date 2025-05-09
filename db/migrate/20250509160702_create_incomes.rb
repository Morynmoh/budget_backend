class CreateIncomes < ActiveRecord::Migration[8.0]
  def change
    create_table :incomes do |t|
      t.references :account, null: false, foreign_key: true
      t.decimal :amount
      t.date :date
      t.string :source

      t.timestamps
    end
  end
end
