class EpisodeRoomUser < ApplicationRecord
  belongs_to :episode_room
  belongs_to :user
  
end
