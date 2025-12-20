class CreateRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :status
      t.integer :max_penlights

      t.timestamps
    end
  end
end
