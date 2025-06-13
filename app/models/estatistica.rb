class Estatistica < ApplicationRecord
  # Sessão mais vista
#   def self.sessao_mais_vista
#     Sessao.joins(:ingressos)
#           .group(:id)
#           .order('COUNT(ingressos.id) DESC')
#           .limit(1)
#           .pluck(:id, :horario)
#           .first
#   end

#   # Valor total do dia
#   def self.valor_do_dia
#     Ingresso.where('DATE(created_at) = ?', Date.today).sum(:valor)
#   end

#   # Peça mais vista
#   def self.peca_mais_vista
#     Peca.joins(sessoes: :ingressos)
#         .group(:id)
#         .order('COUNT(ingressos.id) DESC')
#         .limit(1)
#         .pluck(:id, :titulo)
#         .first
#   end

#   # Área mais ocupada
#   def self.area_mais_ocupada
#     Area.joins(:ingressos)
#         .group(:id)
#         .order('COUNT(ingressos.id) DESC')
#         .limit(1)
#         .pluck(:id, :nome)
#         .first
#   end
end
