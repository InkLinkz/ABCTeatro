class Ingresso < ApplicationRecord
  belongs_to :usuario
  belongs_to :sessao
  belongs_to :area

  # validates :poltrona, uniqueness: { scope: [:sessao_id, :area_id], message: "já está ocupada para esta sessão e área" }
  validate :area_nao_lotada

  before_validation :set_valor

  private

  def set_valor
    self.valor = area.preco if area.present?
  end

  def area_nao_lotada
    ocupados = Ingresso.where(sessao_id: sessao_id, area_id: area_id).count
    if area.present? && ocupados >= area.quantidade_poltronas
      errors.add(:base, "Capacidade máxima da área atingida para esta sessão")
    end
  end
end
