class EpisodeRoom < ApplicationRecord
  validates :name, presence: true
  validates :episode, presence: true
  validates :order, presence: true

  belongs_to :episode
  belongs_to :order
  has_many :episode_room_users
  has_many :users, through: :episode_room_users
  has_many :chats, dependent: :destroy
end
