class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :cep
      t.string :name
      t.string :street
      t.string :complement
      t.string :neighborhood
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
