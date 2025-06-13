class Sessao < ApplicationRecord
  self.table_name = 'sessoes'
  belongs_to :peca


 enum :horario, [:manha, :tarde, :noite]
  
  def descricao_completa
    "#{peca.titulo} - #{horario}"
  end
end