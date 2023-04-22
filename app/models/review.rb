class Review < ApplicationRecord

  has_one_attached :image

  has_many :keyword_reviews, dependent: :destroy
  has_many :keywords, through: :keyword_reviews
  has_many :comments, dependent: :destroy
  belongs_to :user

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/review_noimage.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
