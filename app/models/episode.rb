class Episode < ApplicationRecord
  include Rails.application.routes.url_helpers
  extend ActiveHash::Associations::ActiveRecordExtensions

  # validates :image, presence: true
  validates :title, presence: true
  validates :explain, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :limit, presence: true
  validates :period, presence: true
  validates :user, presence: true

  has_one_attached :image
  # has_many :episode_comments
  has_many :episode_rooms, dependent: :destroy
  belongs_to :user
  has_many :orders

end
