class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.text :address
      t.date :birth_date
      t.boolean :adm

      t.timestamps
    end
  end
end