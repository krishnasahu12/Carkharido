class AddCarToReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :car, null: false, foreign_key: true
  end
end
