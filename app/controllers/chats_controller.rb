class ChatsController < ApplicationController
  def index
    chats = EpisodeRoom.find(params[:episode_room_id]).chats
    render json: chats.to_json(include: [:user, :episode_room])
  end

  def create
    @chat = Chat.new(chat_params)
    if params[:chat][:image]
      blob = ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new(decode(params[:chat][:image][:data]) + "\n"),
        filename: params[:chat][:image][:name]
      )
      @chat.image.attach(blob)
      @chat["image_url"] = url_for(@chat.image)
    end
    if @chat.save
      render json: { status: :created, chat: @chat }
    else
      render json: @chat.errors, status: 422
    end
  end
  
  private

  def chat_params
    params.require(:chat).permit(:content, :episode_room_id, :image, :canvasUrl).merge(user_id: current_user.id)
  end

  def decode(str)
    Base64.decode64(str.split(',').last)
  end
end
