class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat#{params[:room_id]}"
  end

  def unsubscribed
  end

  def chat(data)
    message = { sender: current_user.nickname, body: data['body'] }
    # 一時的にメッセージを保持する
    @messages ||= []
    @messages << message
    Rails.logger.debug @messages
    ActionCable.server.broadcast("chat#{params[:room_id]}", message)
  end

  def reconnect
    # 再接続時に保持したメッセージを再送信する
    Rails.logger.debug @messages
    @messages&.each { |message| ActionCable.server.broadcast("chat#{params[:room_id]}", message) }
  end
end