# app/models/room.rb
class Room < ApplicationRecord
  has_many :penlights, dependent: :destroy
  has_many :participants, dependent: :destroy

  after_create :create_penlights

  private

  def create_penlights
    max_penlights.times do |i|
      penlights.create!(
        index: i,
        current_color: "#ffffff",
        angle: 0
      )
    end
  end
end
