class AddressBusiness < Address
  belongs_to :client, class_name: "User", optional: true

end
