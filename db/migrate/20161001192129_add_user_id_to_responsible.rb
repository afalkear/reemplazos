class AddUserIdToResponsible < ActiveRecord::Migration[5.0]
  def change
    add_column :responsibles, :user_id, :integer
  end
end
