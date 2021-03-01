class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.references :official, foreign_key:true
      t.timestamps
    end
  end
end
