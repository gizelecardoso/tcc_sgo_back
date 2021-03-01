class CreateClerks < ActiveRecord::Migration[6.1]
  def change
    create_table :clerks do |t|
      t.references :company, foreign_key: true
      t.references :official, foreign_key: true

      t.timestamps
    end
  end
end
