class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.references :account, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.decimal :amount
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
