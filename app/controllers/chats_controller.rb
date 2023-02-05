class ChatsController < ApplicationController
  def index
    chats = Chat.all
    render json: chats.to_json(include: [:user, :episode_room])
  end

  def create
    chat = Chat.new(chat_params)
    if chat.save
      render json: chat
    else
      render json: chat.errors, status: 422
    end
  end
  
  private

  def chat_params
    params.require(:chat).permit(:content, :episode_room_id).merge(user_id: current_user.id)
  end
end
