class EpisodeRoomsController < ApplicationController

  def index
    episode_room_users = EpisodeRoomUser.all
    render json: episode_room_users.to_json(include: [:user, :episode_room, episode_room: { include: :episode}])
    # episode_room_users = EpisodeRoomUser.includes([:user, episode_room: :episode])
    # binding.pry
    # render json: episode_room_users
  end

  def show
    episode_room = EpisodeRoom.find(params[:id])
    render json: episode_room.to_json(include: :user)
  end

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
