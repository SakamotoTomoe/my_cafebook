class Review < ApplicationRecord

  has_one_attached :image

  has_many :keyword_reviews, dependent: :destroy
  has_many :keywords, through: :keyword_reviews
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :cafe_name, presence: true
  validates :address, presence: true
  validates :opening_hours, presence: true
  validates :day_off, presence: true
  validates :review, presence: true

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/review_noimage.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

end
