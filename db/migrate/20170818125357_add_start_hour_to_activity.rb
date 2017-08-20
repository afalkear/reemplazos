class AddStartHourToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :start_hour, :integer
  end
end
