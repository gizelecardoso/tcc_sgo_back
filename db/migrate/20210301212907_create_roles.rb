class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :role_code
      t.string :role_name
      t.string :role_category
      t.text :role_description

      t.timestamps
    end
  end
end
