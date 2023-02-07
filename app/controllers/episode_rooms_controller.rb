class EpisodeRoomsController < ApplicationController

  def index
    episode_room_users = current_user.episode_room_users
    render json: episode_room_users.to_json(include: [:user, :episode_room, episode_room: { include: :episode}])
  end

  # def show
  #   episode_room = Episode_room.find(params[:id])
  #   chats = episode.chats
  #   render json: chats.to_json(include: [:user, :episode_room])
  # end

  def create
    @episode_room = EpisodeRoom.new(episode_room_params)
    if @episode_room.save
      render json: { status: :created, episode: @episode_room }
    else
      render json: { status: 500 }
    end
  end

  private

  def episode_room_params
    params.require(:episode_room).permit(:name, :episode_id, user_ids: [])
  end
  
end
