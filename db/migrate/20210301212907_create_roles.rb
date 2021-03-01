class CreateRole < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :role_code
      t.string :role_name
      t.text :role_description

      t.timestamps
    end
  end
end
