class AddConfirmedToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :confirmed, :boolean, :default => false
  end
end
