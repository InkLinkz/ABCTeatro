class EstatisticasService
  def valor_total_dia
    Ingresso.where(created_at: Time.zone.today.all_day).sum(:valor)
  end

  def sessao_mais_vista
    Ingresso.group(:sessao_id).order('count_id DESC').count(:id).first&.then do |sessao_id, _|
      Sessao.find_by(id: sessao_id)&.descricao_completa || "Nenhuma"
    end
  end

  def peca_mais_vista
    resultado = Ingresso.joins(sessao: :peca)
                        .group('pecas.id', 'pecas.titulo')
                        .order('COUNT(ingressos.id) DESC')
                        .count('ingressos.id')
                        .first
    return "Nenhuma" unless resultado

    _chave, _quantidade = resultado
    _peca_id, peca_titulo = _chave
    peca_titulo
  end

  def area_mais_utilizada
    Ingresso.group(:area_id).order('count_id DESC').count(:id).first&.then do |area_id, _|
      Area.find_by(id: area_id)&.nome || "Nenhuma"
    end
  end
end