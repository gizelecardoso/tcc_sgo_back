class CreateActivityItems < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_items do |t|
      t.string :item_name
      t.string :item_status
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
