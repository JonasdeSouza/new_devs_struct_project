class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :name, :email, :cpf, :birth_date, presence: true

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
end
