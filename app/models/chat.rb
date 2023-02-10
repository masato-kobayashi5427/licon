class Chat < ApplicationRecord
  include Rails.application.routes.url_helpers
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  # validates :content, presence: true
  validates :user, presence: true
  validates :episode_room, presence: true

  has_one_attached :image
  belongs_to :user
  belongs_to :episode_room
end
