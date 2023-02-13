class Order < ApplicationRecord
  validates :user, numericality: {other_than: 0, message: "can't be blank"}
  validates :episode, numericality: {other_than: 0, message: "can't be blank"}

  belongs_to :user
  belongs_to :episode
  has_one :episode_room
end
