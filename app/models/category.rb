class Category < ApplicationRecord

  has_many :pricings, dependent: :destroy
  accepts_nested_attributes_for :pricings, allow_destroy: true, reject_if: proc { |att| att['overview'].blank? }

  has_many :listings, dependent: :destroy
  has_many :offers

  validates :name, presence: true, length: { minimum: 4, maximum: 25 }
  validates_uniqueness_of :name

  validates_length_of :name, :minimum => 2, :allow_blank => true

end
