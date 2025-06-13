class Usuario < ApplicationRecord
  has_many :ingressos
  validates :cpf, presence: true, uniqueness: true
    validates :nome, presence: true
    validates :telefone, presence: true
    validates :endereco, presence: true
  validates :data_nascimento, presence: true
end
