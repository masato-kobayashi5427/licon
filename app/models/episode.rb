class Episode < ApplicationRecord
  include Rails.application.routes.url_helpers
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :title, presence: { message: "タイトルを入力してください"}
  validates :explain, presence: { message: "説明文をを入力してください"}
  validates :price, presence: { message: "価格を入力してください" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: "価格は半角数字で300円以上9999999円以下で入力してください" }, if: -> { price.present? }
  validates :price, format: { with: /\A[0-9]+\z/, message: "価格は半角数字で入力してください" }, if: -> { price.present? && errors[:price].empty? }
  validates :category, presence: { message: "カテゴリーを選択してください"}
  validates :limit, presence: { message: "期限を入力してください"}
  validates :period, presence: { message: "期間を入力してください"}
  validates :user, presence: { message: "ユーザーが見つかりませんでした" }
  validates :image_url, presence: { message: "画像を入力してください"}
  validate :validate_image_size

  has_one_attached :image
  has_many :episode_rooms, dependent: :destroy
  belongs_to :user
  has_many :orders

  private

  def validate_image_size
    if image.attached? && image.blob.byte_size > 5.megabytes
      image.purge # ファイルを削除する
      errors.add(:image, '画像のサイズは5MB以下にしてください')
    end
  end

end
