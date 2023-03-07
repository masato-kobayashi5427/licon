class EpisodeRoomsController < ApplicationController

  def index
    episode_room_users = current_user.episode_room_users
    render json: episode_room_users.to_json(include: [:user, :episode_room, episode_room: { include: [:episode, :chats]}])
  end

  def create
    @order_episode_room = OrderEpisodeRoom.new(order_params)
    if @order_episode_room.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @order_episode_room.price,  # 商品の値段
        card: @order_episode_room.token,    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order_episode_room.save
      render json: { status: :created, episode: @order_episode_room }
    end
  end

  private

  def order_params
    params.require(:order_episode_room).permit(:name, :episode_id ,:order_id, :price, :token, :user_id, user_ids: [])
  end
  
end
