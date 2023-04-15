class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      
      t.integer :user_id, null: false
      t.string :cafe_name, null: false
      t.string :address, null: false
      t.string :opening_hours, null: false
      t.string :day_off, null: false
      t.text :review, null: false

      t.timestamps
    end
  end
end
