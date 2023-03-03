class EpisodeRoom < ApplicationRecord
  
  belongs_to :episode
  belongs_to :order
  has_many :episode_room_users
  has_many :users, through: :episode_room_users
  has_many :chats, dependent: :destroy
end
