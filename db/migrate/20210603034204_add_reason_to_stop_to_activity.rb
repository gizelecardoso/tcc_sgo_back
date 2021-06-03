class AddReasonToStopToActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :reason_to_stop, :string
  end
end
