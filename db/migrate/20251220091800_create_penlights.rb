class CreatePenlights < ActiveRecord::Migration[8.1]
  def change
    create_table :penlights do |t|
      t.references :room, null: false, foreign_key: true
      t.integer :index
      t.string :current_color
      t.integer :angle

      t.timestamps
    end
  end
end
