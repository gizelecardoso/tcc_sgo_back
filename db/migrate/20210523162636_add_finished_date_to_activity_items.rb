class AddFinishedDateToActivityItems < ActiveRecord::Migration[6.1]
  def change
    add_column :activity_items, :finished_date, :timestamps
  end
end
