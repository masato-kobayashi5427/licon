class EpisodeRoomUser < ApplicationRecord
  validates :user, numericality: {other_than: 0, message: "can't be blank"}
  validates :episode_room, numericality: {other_than: 0, message: "can't be blank"}

  belongs_to :episode_room
  belongs_to :user
end
