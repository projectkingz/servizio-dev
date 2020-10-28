class Contact < ApplicationRecord

  before_save do
    self.full_name = full_name
  end

  belongs_to :client, class_name: "User", optional: true
  belongs_to :supplier, class_name: "Trade", optional: true
  belongs_to :admin, optional: true
  belongs_to :listing, optional: true
  belongs_to :booking, optional: true
  belongs_to :quote, optional: true

  validates :first_name, :last_name, :mobile_phone, presence: true


  def full_name
    [first_name, last_name].join(' ')
  end



end
