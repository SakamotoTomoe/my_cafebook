class CreateKeywordReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :keyword_reviews do |t|
      t.references :keyword, null: false, foreign_key: true
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
