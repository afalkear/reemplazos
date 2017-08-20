class AddEndHourToActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :end_hour, :integer
  end
end
