# app/controllers/rooms_controller.rb
class RoomsController < ApplicationController
  # POST /rooms/:id/join
  def join
    room = Room.find(params[:id])

    participant = room.participants.create!(
      device_id: join_params[:device_id],
      nickname: join_params[:nickname]
    )

    assign_penlights(room, participant)

    render json: {
      participant_id: participant.id,
      penlight_ids: participant.penlights.pluck(:id)
    }
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Room not found" }, status: :not_found
  rescue ActiveRecord::RecordInvalid => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  # Strong Parameters
  def join_params
    params.permit(:device_id, :nickname)
  end

  # 最も参加人数が少ないペンライトを割り当てる
  def assign_penlights(room, participant)
    penlight = room.penlights
                   .left_joins(:participant_penlights)
                   .group("penlights.id")
                   .order("COUNT(participant_penlights.id) ASC")
                   .first

    return unless penlight

    ParticipantPenlight.create!(
      participant: participant,
      penlight: penlight
    )
  end
end
