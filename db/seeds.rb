# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Peca.create!([
  { titulo: "O Mistério do Palco", descricao: "Suspense teatral", duracao: 120 },
  { titulo: "Comédia em Cena", descricao: "Risos garantidos", duracao: 90 },
  { titulo: "Drama da Vida", descricao: "Emocione-se", duracao: 110 }
])

Area.find_or_create_by!(nome: "Plateia A") do |a|
  a.preco = 40.0
  a.quantidade_poltronas = 25
end
Area.find_or_create_by!(nome: "Plateia B") do |a|
  a.preco = 60.0
  a.quantidade_poltronas = 100
end
Area.find_or_create_by!(nome: "Frisa") do |a|
  a.preco = 120.0
  a.quantidade_poltronas = 30
end
Area.find_or_create_by!(nome: "Camarote") do |a|
  a.preco = 80.0
  a.quantidade_poltronas = 50
end
Area.find_or_create_by!(nome: "Balcão Nobre") do |a|
  a.preco = 250.0
  a.quantidade_poltronas = 50
end

array_sessoes = [
  { peca_id: 1, horario: :manha },
  { peca_id: 1, horario: :noite },
  { peca_id: 2, horario: :manha },
  { peca_id: 2, horario: :tarde },
  { peca_id: 2, horario: :noite },
  { peca_id: 3, horario: :manha },
  { peca_id: 3, horario: :tarde },
  { peca_id: 3, horario: :noite }
]

Sessao.create!(array_sessoes)


25.times do |i|
  Poltrona.create!(numero: i + 1, area_id: 1, disponivel: true)
end

100.times do |i|
  Poltrona.create!(numero: i + 1, area_id: 2, disponivel: true)
end
    
30.times do |i|
  Poltrona.create!(numero: i + 1, area_id: 3, disponivel: true)
end

50.times do |i|
  Poltrona.create!(numero: i + 1, area_id: 4, disponivel: true)
end

50.times do |i|
  Poltrona.create!(numero: i + 1, area_id: 5, disponivel: true)
end