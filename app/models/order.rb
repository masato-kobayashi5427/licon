class Order < ApplicationRecord
  attr_accessor :token, :order

  validates :user, presence: true
  validates :episode, presence: true
  validates :price, presence: true
  validates :token, presence: true

  belongs_to :user
  belongs_to :episode
  has_one :episode_room
end
