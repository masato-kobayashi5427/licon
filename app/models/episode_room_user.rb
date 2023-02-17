class EpisodeRoomUser < ApplicationRecord
  validates :user, presence: true
  validates :episode_room, presence: true

  belongs_to :episode_room
  belongs_to :user
end
