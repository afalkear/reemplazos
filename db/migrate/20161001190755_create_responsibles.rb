class CreateResponsibles < ActiveRecord::Migration[5.0]
  def change
    create_table :responsibles do |t|
      t.string :name
      t.string :email
      t.integer :horario_id

      t.timestamps
    end
  end
end
