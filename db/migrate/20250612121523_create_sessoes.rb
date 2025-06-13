class CreateSessoes < ActiveRecord::Migration[8.0]
  def change
    create_table :sessoes do |t|
      t.references :peca, null: false, foreign_key: true
      t.integer :horario, default: 0

      t.timestamps
    end
  end
end
