class CreatePecas < ActiveRecord::Migration[8.0]
  def change
    create_table :pecas do |t|
      t.string :titulo
      t.text :descricao
      t.string :classificacao
      t.string :duracao

      t.timestamps
    end
  end
end
