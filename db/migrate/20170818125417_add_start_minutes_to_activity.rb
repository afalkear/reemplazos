class AddStartMinutesToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :start_minutes, :integer
  end
end
