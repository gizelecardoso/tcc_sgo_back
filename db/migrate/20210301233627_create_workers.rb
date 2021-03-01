class CreateWorkers < ActiveRecord::Migration[6.1]
  def change
    create_table :workers do |t|
      t.float :performance

      t.references :clerk, foreign_key: true
      t.references :official, foreign_key: true

      t.timestamps
    end
  end
end
