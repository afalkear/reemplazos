class CreateAlarms < ActiveRecord::Migration[5.0]
  def change
    create_table :alarms do |t|
      t.string :offset
      t.integer :responsible_id
      t.integer :user_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
