class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :episode_room
end
