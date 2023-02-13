class EpisodeRoom < ApplicationRecord
  validates :name, presence: true
  validates :episode, numericality: {other_than: 0, message: "can't be blank"}
  validates :order, numericality: {other_than: 0, message: "can't be blank"}

  belongs_to :episode
  belongs_to :order
  has_many :episode_room_users
  has_many :users, through: :episode_room_users
  has_many :chats, dependent: :destroy
end
