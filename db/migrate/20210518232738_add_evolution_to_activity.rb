class AddEvolutionToActivity < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :evolution, :float
  end
end
