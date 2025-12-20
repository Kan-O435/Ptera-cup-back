class CreateParticipants < ActiveRecord::Migration[8.1]
  def change
    create_table :participants do |t|
      t.references :room, null: false, foreign_key: true
      t.string :nickname
      t.string :device_id

      t.timestamps
    end
  end
end
