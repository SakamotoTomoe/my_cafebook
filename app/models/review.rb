class Review < ApplicationRecord

  has_one_attached :image

  has_many :keyword_reviews, dependent: :destroy
  has_many :keywords, through: :keyword_reviews


end
