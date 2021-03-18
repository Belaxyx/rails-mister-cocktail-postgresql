class Review < ApplicationRecord
  belongs_to :cocktail
  validates :description, presence: true
  validates :rating, presence: true
end
