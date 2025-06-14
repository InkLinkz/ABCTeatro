class Usuario < ApplicationRecord
  has_many :ingressos

  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :telefone, presence: true
  validates :endereco, presence: true
  validates :data_nascimento, presence: true

  validate :cpf_valido

  private

  def cpf_valido
    return if cpf.blank?

    numbers = cpf.gsub(/[^0-9]/, '')

    if numbers.length != 11 || numbers.chars.uniq.length == 1
      errors.add(:cpf, "é inválido")
      return
    end

    digits = numbers.chars.map(&:to_i)

    
    sum = (0..8).inject(0) { |acc, i| acc + digits[i] * (10 - i) }
    first_digit = sum * 10 % 11
    first_digit = 0 if first_digit == 10

    if digits[9] != first_digit
      errors.add(:cpf, "é inválido")
      return
    end

    
    sum = (0..9).inject(0) { |acc, i| acc + digits[i] * (11 - i) }
    second_digit = sum * 10 % 11
    second_digit = 0 if second_digit == 10

    unless digits[10] == second_digit
      errors.add(:cpf, "é inválido")
    end
  end
end
