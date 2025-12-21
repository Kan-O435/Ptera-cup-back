# app/channels/room_channel.rb
class RoomChannel < ApplicationCable::Channel
  def subscribed
    room_id = params[:room_id]
    stream_from "room_#{room_id}"
  end

  def unsubscribed
    # 特になし
  end

  # スマホから送られたデータを受け取る
  def receive(data)
    # data には user_index, color, shake が含まれる
    ActionCable.server.broadcast(
      "room_#{params[:room_id]}",
      message: {
        user_index: data['user_index'],
        color: data['color'],
        shake: data['shake']
      }
    )
  end
end
