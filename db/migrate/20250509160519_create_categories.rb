class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.decimal :monthly_budget

      t.timestamps
    end
  end
end
