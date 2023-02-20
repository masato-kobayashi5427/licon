class Order < ApplicationRecord
  attr_accessor :token, :order

  belongs_to :user
  belongs_to :episode
  has_one :episode_room
end
