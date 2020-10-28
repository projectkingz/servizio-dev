class Booking < ApplicationRecord

  belongs_to :offer, foreign_key: "offer_id", class_name: "Offer"
  belongs_to :client, class_name: "User", optional: true
  belongs_to :supplier, class_name: "Trade", optional: true

  has_many :reviews

  enum status: [:pending, :accepted, :rejected, :withdrawn, :rescheduled]
  #validates :tip_offered, numericality: { only_integer: true, message: "must be a number" }
end
