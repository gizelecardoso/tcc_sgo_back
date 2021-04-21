class AddOfficialRefToActivities < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :official, foreign_key: true
  end
end
