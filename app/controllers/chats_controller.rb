class ChatsController < ApplicationController
  def index
    chats = Chat.order(updated_at: :desc)
    render json: chats.to_json(include: [:user, :episode_room])
  end

  def create
    chat = Chat.new(chat_params)
    binding.pry
    if chat.save
      render json: chat
      ActionCable.server.broadcast "comment_channel", {comment: comment, user: comment.user}
    else
      render json: chat.errors, status: 422
    end
  end

  def chat_params
    params.require(:chat).permit(:content)
  end
end
