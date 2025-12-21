# app/controllers/stage_controller.rb
class StageController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    color = params[:color] || 'white'

    ActionCable.server.broadcast(
      "stage_channel",
      { color: color }
    )

    render json: { status: 'ok' }
  end
end
