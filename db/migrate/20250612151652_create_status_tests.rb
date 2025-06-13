class CreateStatusTests < ActiveRecord::Migration[8.0]
  def change
    create_table :status_tests do |t|
      t.integer :status

      t.timestamps
    end
  end
end
