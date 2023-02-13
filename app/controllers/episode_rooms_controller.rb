class EpisodeRoomsController < ApplicationController

  def index
    episode_room_users = current_user.episode_room_users
    render json: episode_room_users.to_json(include: [:user, :episode_room, episode_room: { include: :episode}])
  end

  def create
    @order = Order.create(order_params)
    EpisodeRoom.create(episode_room_params)
    binding.pry
    # @episode_room = EpisodeRoom.new(episode_room_params)
    # if @episode_room.save
    #   render json: { status: :created, episode: @episode_room }
    # else
    #   render json: { status: 500 }
    # end
  end

  private

  def order_params
    params.permit(:episode_id).merge(user_id: current_user.id)
  end

  def episode_room_params
    params.permit(:name, :episode_id, user_ids: []).merge(order_id: @order.id)
  end
  
end
