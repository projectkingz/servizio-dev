class ListingPricing < ApplicationRecord

  belongs_to :listing, dependent: :destroy

  belongs_to :pricing, dependent: :destroy
end
