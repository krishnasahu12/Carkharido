class Car < ApplicationRecord
  has_many :likes, as: :likeable
  belongs_to :user
  has_many_attached :images
  has_many :reviews
end
