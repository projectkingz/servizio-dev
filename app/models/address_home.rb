class AddressHome <  Address


  before_save do
    self.address_formatted_address = address_formatted_address
  end


  belongs_to :client, class_name: "User", optional: true

  scope :address_businesses, -> { where{ type= 'AddressBusiness'}}
  scope :address_dropoffs, -> { where{ type= 'AddressDropOff'}}
  scope :address_homes, -> { where{ type= 'AddressHome'}}
  scope :address_jobs, -> { where{ type= 'AddressJob'}}
  scope :address_pickups, -> { where{ type= 'AddressPickUp'}}


  VALID_POSTCODE_REGEX= /(GIR 0AA)|((([A-Z-[QVX]][0-9][0-9]?)|(([A-Z-[QVX]][A-Z-[IJZ]][0-9][0-9]?)|(([A-Z-[QVX]][0-9][A-HJKSTUW])|([A-Z-[QVX]][A-Z-[IJZ]][0-9][ABEHMNPRVWXY]))))\s?[0-9][A-Z-[CIKMOV]]{2})/
  validates :address_post_code, presence: true, length: { maximum:10 }, format: { with: VALID_POSTCODE_REGEX }

  validates :address_street_number, :address_street_name, :address_country, presence: true

  def address_formatted_address
    [address_street_number, address_street_name, address_town, address_city, address_post_code, address_country].join(', ')
  end


end
