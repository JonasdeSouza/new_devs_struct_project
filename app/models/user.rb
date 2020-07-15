class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :password, length: { minimum: 3 }, if: :new_user?
  validates :password, confirmation: true
  validates :email, uniqueness: true
  validates :name, :email, :cpf, :birth_date, :addresses, presence: true

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  accepts_nested_attributes_for :addresses

  #Método para adicionar ou retirar valor do saldo
  before_update :change_balance

  def change_balance
    if self.balance_changed?
      if !balance_was.nil?
        self.balance += self.balance_was
      end
    end
  end

  private
  def new_user?
    new_record?
  end
end
