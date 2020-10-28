class Review < ApplicationRecord
  belongs_to :quote
  belongs_to :booking
  belongs_to :client, class_name: "User"
  belongs_to :supplier, class_name: "Trade"
end
