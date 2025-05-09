class CreateInvestments < ActiveRecord::Migration[8.0]
  def change
    create_table :investments do |t|
      t.references :account, null: false, foreign_key: true
      t.string :investment_type
      t.decimal :amount
      t.date :date
      t.string :note

      t.timestamps
    end
  end
end
