class OrderEpisodeRoom
  include ActiveModel::Model
  attr_accessor :name, :episode_id, :order_id, :user_id, :price, :token, :user_ids


  with_options presence: true do
    validates :name, :episode, :user_id, :price
  end

  def save
    order = Order.create(price: price, episode_id: episode_id, user_id: user_id)
    EpisodeRoom.create(name: name, episode_id: episode_id, order_id: order.id, user_ids: user_ids)
  end
end