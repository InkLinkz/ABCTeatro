class CreateIngressos < ActiveRecord::Migration[8.0]
  def change
    create_table :ingressos do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :sessao, null: false, foreign_key: true
      t.references :poltrona, null: false, foreign_key: true
      t.decimal :valor

      t.timestamps
    end
  end
end
