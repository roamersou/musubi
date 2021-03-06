class Payforward < ApplicationRecord
  belongs_to :user
  has_many :gy_comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 400 }
  validate :picture_size

  private

      # アップロードされた画像のサイズをバリデーションする
      def picture_size
        if picture.size > 5.megabytes
          errors.add(:picture, "5MB以下でお願いします")
        end
      end
end
