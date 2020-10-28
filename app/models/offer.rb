class Offer < ApplicationRecord
  belongs_to :client, class_name: "User", optional: true
  belongs_to :supplier, foreign_key: "supplier_id", class_name: "Trade", optional: true
  belongs_to :category

  has_one_attached :attachment_file
  has_many :bookings, dependent: :delete_all

  enum status: [:pending, :accepted, :rejected, :withdrawn, :rescheduled]

  validates :title, presence: { message: "cannot be empty"}
  validates :description, presence: { message: "cannot be empty"}
  validates :valid_to, presence: { only_date: true, message: "cannot be empty"}
end
