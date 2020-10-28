class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable
         #, :trackable

   has_one_attached :avatar

   #has_many :listings

   before_save { self.email = email.downcase }

   validates :full_name, presence: true, length: {maximum: 50}

   validates :username, presence: true, uniqueness: { case_sensitive: false },
             length: {minimum:3, maximum: 25}

   VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, length: { maximum:105 },
               uniqueness: { case_sensitive: false },
               format: { with: VALID_EMAIL_REGEX }

   def self.from_omniauth(auth)
     admin = Admin.where(email: auth.info.email).first

       if admin
         if !admin.provider
           admin.update(uid: auth.uid, provider: auth.provider, image: auth.info.image)
         end
         return admin
       else

           where(provider: auth.provider, uid: auth.uid).first_or_create do |admin|
             admin.email = auth.info.email
             admin.password = Devise.friendly_token[0, 20]
             admin.full_name = auth.info.name   # assuming the user model has a name
             admin.image = auth.info.image # assuming the user model has an image
             # If you are using confirmable and the provider(s) you use validate emails,
             # uncomment the line below to skip the confirmation emails.
             # user.skip_confirmation!

             admin.uid = auth.uid
             admin.provider = auth.provider

       end
     end
   end
 end
