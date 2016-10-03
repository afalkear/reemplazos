class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.date :date
      t.integer :responsible_id
      t.integer :user_id
      t.time :start
      t.time :end

      t.timestamps
    end
  end
end
