class Chat < ApplicationRecord
  include Rails.application.routes.url_helpers
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  # validates :content, presence: true
  validates :user, presence: true
  validates :episode_room, presence: true
  validate :at_least_one_field_present

  has_one_attached :image
  belongs_to :user
  belongs_to :episode_room

  private
  def at_least_one_field_present
    if content.present? && image.attached? && canvasUrl.present?
      errors.add(:base, "content, image_url, or canvasUrl must be present")
    end
  end
end
