class CreateAreas < ActiveRecord::Migration[8.0]
  def change
    create_table :areas do |t|
      t.string :nome
      t.decimal :preco
      t.integer :quantidade_poltronas

      t.timestamps
    end
  end
end
