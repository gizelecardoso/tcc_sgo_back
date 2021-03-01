class CreateOfficials < ActiveRecord::Migration[6.1]
  def change
    create_table :officials do |t|
      t.string :official_code
      t.string :official_name
      t.string :login_name
      t.string :login_password
      t.references :role, foreign_key:true

      t.timestamps
    end
  end
end
