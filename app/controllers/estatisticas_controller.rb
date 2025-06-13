class EstatisticasController < ApplicationController
  def index
    # Peça mais e menos vendida
    pecas_vendas = Ingresso.group(:peca_id).count
    @peca_mais_vendida = Peca.find_by(id: pecas_vendas.max_by { |_, v| v }&.first)
    @peca_menos_vendida = Peca.find_by(id: pecas_vendas.min_by { |_, v| v }&.first)

    # Sessão mais e menos ocupada
    sessoes_ocupacao = Ingresso.group(:sessao_id).count
    @sessao_mais_ocupada = Sessao.find_by(id: sessoes_ocupacao.max_by { |_, v| v }&.first)
    @sessao_menos_ocupada = Sessao.find_by(id: sessoes_ocupacao.min_by { |_, v| v }&.first)

    # Peça mais e menos lucrativa
    pecas_lucro = Ingresso.joins(:peca).group(:peca_id).sum(:preco)
    @mais_lucrativa = Peca.find_by(id: pecas_lucro.max_by { |_, v| v }&.first)
    @menos_lucrativa = Peca.find_by(id: pecas_lucro.min_by { |_, v| v }&.first)

    # Faturamento médio por peça
    @faturamento_medio = {}
    pecas_lucro.each do |peca_id, total|
      quantidade = pecas_vendas[peca_id] || 1
      @faturamento_medio[peca_id] = total.to_f / quantidade
    end
  end
end
