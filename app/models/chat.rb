class Chat < ApplicationRecord
  validates :content, presence: true
  validates :user, presence: true
  validates :episode_room, presence: true

  belongs_to :user
  belongs_to :episode_room
end
