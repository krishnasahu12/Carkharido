class Review < ApplicationRecord
  has_many :likes, as: :likeable
  belongs_to :car
end
