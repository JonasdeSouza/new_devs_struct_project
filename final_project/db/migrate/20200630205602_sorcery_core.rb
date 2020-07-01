class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :crypted_password, :string, default: nil
    add_column :users, :salt, :string, default: nil

    add_index :users, :email, unique: true
  end
end
