class AddOffsetTypeToAlarm < ActiveRecord::Migration[5.0]
  def change
    add_column :alarms, :offset_type, :string
  end
end
