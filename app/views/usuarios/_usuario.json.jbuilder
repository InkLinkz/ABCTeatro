json.extract! usuario, :id, :nome, :cpf, :telefone, :endereco, :data_nascimento, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
