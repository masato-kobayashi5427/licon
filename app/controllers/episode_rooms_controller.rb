class EpisodeRoomsController < ApplicationController

  def index
    episode_room_users = current_user.episode_room_users
    render json: episode_room_users.to_json(include: [:user, :episode_room, episode_room: { include: :episode}])
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      binding.pry
      EpisodeRoom.create(episode_room_params)
    end
  end

  private

  def order_params
    params.permit(:episode_id, :price, :token).merge(user_id: current_user.id)
  end

  def episode_room_params
    params.permit(:name, :episode_id, user_ids: []).merge(order_id: @order.id)
  end
  
end
