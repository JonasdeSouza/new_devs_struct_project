class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :alcoholic
      t.references :category, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
