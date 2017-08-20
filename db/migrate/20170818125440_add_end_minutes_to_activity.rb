class AddEndMinutesToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :end_minutes, :integer
  end
end
