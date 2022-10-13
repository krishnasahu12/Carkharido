class Car < ApplicationRecord
  has_many :likes, as: :likeable ,dependent: :destroy
  belongs_to :user
  has_many_attached :images
  has_many :reviews
  has_many :enquiries
end
