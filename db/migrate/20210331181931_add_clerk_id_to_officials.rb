class AddClerkIdToOfficials < ActiveRecord::Migration[6.1]
  def change
    # add_foreign_key :officials, column: :clerk_id
    add_column :officials, :clerk_id, :integer, references: :officials
  end
end
