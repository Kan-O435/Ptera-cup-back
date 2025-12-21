class CreateParticipantPenlights < ActiveRecord::Migration[8.1]
  def change
    create_table :participant_penlights do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :penlight, null: false, foreign_key: true

      t.timestamps
    end
  end
end
