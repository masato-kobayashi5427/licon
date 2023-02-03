class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'chat'
  end

  def unsubscribed
  end

  def chat(data)
    ActionCable.server.broadcast('chat', { sender: current_user.nickname, body: data['body'] })
  end
end