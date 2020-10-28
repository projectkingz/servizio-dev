class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
    :validatable, :omniauthable
  #, :confirmable, :trackable,

  validates :full_name, presence: true, length: {maximum: 50}

  has_one_attached :avatar
  has_many :gigs

  has_many :client_quotes, foreign_key: "client_id", class_name: "Quote"
  has_many :listings, foreign_key: "client_id", class_name: "Listing" , dependent: :destroy
  has_many :bookings, foreign_key: "client_id", class_name: "Booking"
  has_many :reviews, foreign_key: "client_id", class_name: "Review"
  has_one :address, foreign_key: "client_id", class_name: "Address"
  accepts_nested_attributes_for :address

  has_one :contact, foreign_key: "client_id", class_name: "Contact"
  accepts_nested_attributes_for :contact

  before_create :build_address_profile
  before_create :build_contact_profile

  has_many :address_businesses, foreign_key: "client_id", class_name: "AddressBusiness"
  has_many :address_dropoffs, foreign_key: "client_id", class_name: "AddressDropoff"
  has_many :address_homes, foreign_key: "client_id", class_name: "AddressHome"
  has_many :address_jobs, foreign_key: "client_id", class_name: "AddressJob"
  has_many :address_pickups, foreign_key: "client_id", class_name: "AddressPickup"

  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false },
            length: {minimum:3, maximum: 25}

  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum:105 },
              uniqueness: { case_sensitive: false },
              format: { with: VALID_EMAIL_REGEX }

    def self.from_omniauth(auth)
      user = User.where(email: auth.info.email).first

        if user
          if !user.provider
            user.update(uid: auth.uid, provider: auth.provider, image: auth.info.image)
          end
          return user
        else

            where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
              user.email = auth.info.email
              user.password = Devise.friendly_token[0, 20]
              user.full_name = auth.info.name   # assuming the user model has a name
              user.image = auth.info.image # assuming the user model has an image
              # If you are using confirmable and the provider(s) you use validate emails,
              # uncomment the line below to skip the confirmation emails.
              # user.skip_confirmation!

              user.uid = auth.uid
              user.provider = auth.provider


        end
      end
    end

  private
  def build_address_profile
    build_address
    true
  end

  def build_contact_profile
    build_contact
    true
  end

  end
