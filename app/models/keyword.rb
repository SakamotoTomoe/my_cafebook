class Keyword < ApplicationRecord
  
  has_many :keyword_reviews, dependent: :destroy
  has_many :reviews, through: :keyword_reviews

  
end
