class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :name, :email, :cpf, :birth_date, :address, presence: true

  has_many :orders, dependent: :destroy

  #Método para adicionar ou retirar valor do saldo
  before_update :change_balance

  def change_balance
    if self.balance_changed?
      self.balance += self.balance_was
    end
  end

end
