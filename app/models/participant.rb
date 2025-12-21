# app/models/participant.rb
class Participant < ApplicationRecord
  belongs_to :room
  has_many :participant_penlights, dependent: :destroy
  has_many :penlights, through: :participant_penlights
end
