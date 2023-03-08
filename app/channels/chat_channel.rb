class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat#{params[:room_id]}"
  end

  def unsubscribed
  end

  def chat(data)
    ActionCable.server.broadcast("chat#{params[:room_id]}", { sender: current_user.nickname, body: data['body'] })
  end
end