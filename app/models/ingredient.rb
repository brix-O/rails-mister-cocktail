class Ingredient < ApplicationRecord
  has_many :ingredients
  has_many :doses

  validates :name, presence: true, uniqueness: true
end
