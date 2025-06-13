class CreateUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :endereco
      t.date :data_nascimento

      t.timestamps
    end
  end
end
