class CreateEstatisticas < ActiveRecord::Migration[8.0]
  def change
    create_table :estatisticas do |t|
      t.timestamps
    end
  end
end
