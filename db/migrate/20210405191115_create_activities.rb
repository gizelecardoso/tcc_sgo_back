class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :activity_code
      t.string :activity_name
      t.string :activity_description
      t.date :expected_initial_date
      t.date :expected_final_date
      t.date :initial_date
      t.date :final_date
      t.date :stopped_date
      t.string :activity_status

      t.timestamps
    end
  end
end
