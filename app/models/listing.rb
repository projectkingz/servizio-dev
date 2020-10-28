class Listing < ApplicationRecord

  before_create   :calc_fields

  belongs_to :client, class_name: "User", optional: true
  belongs_to :category, optional: true, foreign_key: "category_id", class_name: "Category"
  belongs_to :urgency

  has_many_attached :photos
  has_rich_text :description

  has_many :quotes

  has_many :reviews

  validates :title, presence: { message: 'cannot be blank' }

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:stars).round(1)
  end

  def calc_fields
    self.expiry_date = self.created_at  + 1000.days;
  end

  #has_many :pricings
  #accepts_nested_attributes_for :pricings
  #has_many :listing_categories
  #accepts_nested_attributes_for :listing_pricings, allow_destroy: true, reject_if: proc { |att| att['pricing_id'].blank? }

  # has_many :listing_pricings
  # has_many :pricings, through: :listing_pricings

end
