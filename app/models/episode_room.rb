class EpisodeRoom < ApplicationRecord
  belongs_to :episode
  has_many :episode_room_users
  has_many :users, through: :episode_room_users
  has_many :chats, dependent: :destroy
end
