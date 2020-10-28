class Quote < ApplicationRecord
  belongs_to :listing, optional: true, foreign_key: "listing_id", class_name: "Listing", required: false
  belongs_to :client, class_name: "User", optional: true
  belongs_to :supplier, class_name: "Trade", optional: true
  belongs_to :offer, required: false

  has_many :reviews

  enum status: [:pending, :accepted, :rejected, :withdrawn]

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:stars).round(1)
  end
end
