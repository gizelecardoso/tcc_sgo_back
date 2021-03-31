class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :company_code
      t.string :company_name
      t.string :company_branch

      t.timestamps
    end
  end
end
