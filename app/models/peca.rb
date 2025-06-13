class Peca < ApplicationRecord
    has_many :sessao, dependent: :destroy
    has_many :poltrona, through: :sessao
    has_many :area, through: :sessao
    has_many :ingresso, through: :sessao
    has_many :usuario, through: :ingresso
    
    #validates :nome, presence: true, uniqueness: true
    #validates :data, presence: true
    #validates :hora, presence: true
    validates :descricao, presence: true
end
