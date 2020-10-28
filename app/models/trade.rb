class Trade < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one_attached :avatar

   has_many :supplier_quotes, foreign_key: "supplier_id", class_name: "Quote"

   before_save { self.email = email.downcase }

   validates :full_name, presence: true, length: {maximum: 50}

   validates :username, presence: true, uniqueness: { case_sensitive: false },
             length: {maximum: 50}

    has_many :offers
    has_many :bookings, foreign_key: "supplier_id", class_name: "Booking"
    has_many :reviews, foreign_key: "supplier_id", class_name: "Review"

   VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum:105 },
               uniqueness: { case_sensitive: false },
               format: { with: VALID_EMAIL_REGEX }

   def self.from_omniauth(auth)
     trade = Trade.where(email: auth.info.email).first

       if trade
         if !trade.provider
           trade.update(uid: auth.uid, provider: auth.provider, image: auth.info.image)
         end
         return trade
       else

           where(provider: auth.provider, uid: auth.uid).first_or_create do |trade|
             trade.email = auth.info.email
             trade.password = Devise.friendly_token[0, 20]
             trade.full_name = auth.info.name   # assuming the user model has a name
             trade.image = auth.info.image # assuming the user model has an image
             # If you are using confirmable and the provider(s) you use validate emails,
             # uncomment the line below to skip the confirmation emails.
             # user.skip_confirmation!

             trade.uid = auth.uid
             trade.provider = auth.provider

       end
     end
   end
 end
