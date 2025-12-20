# app/models/penlight.rb
class Penlight < ApplicationRecord
  belongs_to :room
  has_many :participant_penlights, dependent: :destroy
  has_many :participants, through: :participant_penlights
end
