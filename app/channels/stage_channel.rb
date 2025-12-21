# app/channels/stage_channel.rb
class StageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stage_channel"
  end
end
