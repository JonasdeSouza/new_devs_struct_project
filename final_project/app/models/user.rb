class User < ApplicationRecord
  validates :name, :email, :cpf, :birth_date, :address, presence: true

  has_many :orders, dependent: :destroy
end
