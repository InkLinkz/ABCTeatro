class Area < ApplicationRecord
    
    has_many :ingressos, dependent: :destroy
    has_many :usuarios, dependent: :destroy
    has_many :poltronas, dependent: :destroy
    has_many :sessoes, dependent: :destroy
    has_many :pecas, through: :sessoes

    validates :nome, presence: true, uniqueness: true
    #validates :capacidade, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :preco, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
