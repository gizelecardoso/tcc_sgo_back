class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :activity_code
      t.string :activity_name
      t.string :activity_description
      t.timestamp :expected_initial_date
      t.timestamp :expected_final_date
      t.timestamp :initial_date
      t.timestamp :final_date
      t.timestamp :stopped_date
      t.string :activity_status

      t.timestamps
    end
  end
end
