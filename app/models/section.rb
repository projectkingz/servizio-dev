class Section < ApplicationRecord

  has_many :category_sections
  has_many :categories, through: :category_sections

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name



end
