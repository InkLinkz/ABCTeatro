class CreatePoltronas < ActiveRecord::Migration[8.0]
  def change
    create_table :poltronas do |t|
      t.references :area, null: false, foreign_key: true
      t.string :numero
      t.boolean :disponivel

      t.timestamps
    end
  end
end
