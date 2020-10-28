module ApplicationHelper
  def avatar_url(user)
    if user.nil?
      ActionController::Base.helpers.asset_path('icon_default_avatar.png')
    elsif user.avatar.attached?
      url_for(user.avatar)
    elsif user.image?
      user.image
    else
      ActionController::Base.helpers.asset_path('icon_default_avatar.png')
    end
  end

  def listing_cover(listing)
    if listing.photos.attached?
      url_for(listing.photos[0])
    else
      ActionController::Base.helpers.asset_path('icon_default_image.png')
    end
  end

  # def link_to_add_row(name, f, association, **args)
  #   new_object = f.object.send(association).klass.new
  #   id = new_object.object_id
  #   fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
  #     render(association.to_s.singularize, f: builder)
  #   end
  #   link_to(name, '#', class: "add_fields " + args[:class], data: {id: id, fields: fields.gsub("\n","")})
  # end
end




###############################################################################
###code below is redundant for now
###changed for now 02.Oct.2019

#def user_avatar(user, size=150)
  # if user.image?
  #   user.image
  # elsif user.avatar.attached?
  #   user.avatar.variant(resize: "#{size}x#{size}!")
  # elsif
  #   gravatar_image_url(user.email, size: size)
  # else
  #  ActionController::Base.helpers.asset_path('icon_default_avatar.png')
  # end
#end


# def trade_avatar(trade, size=150)
#   if trade.image?
#     trade.image
#   elsif trade.avatar.attached?
#     trade.avatar.variant(resize: "#{size}x#{size}!")
#   elsif
#     gravatar_image_url(trade.email, size: size)
#   else
#     ActionController::Base.helpers.asset_path('icon_default_avatar.png')
#   end
# end

# def admin_avatar(admin, size=128)
#   if admin.avatar.attached?
#     admin.avatar.variant(resize: "#{size}x#{size}!")
#   elsif
#     gravatar_image_url(admin.email, size: size)
#   else
#     ActionController::Base.helpers.asset_path('icon_default_avatar.png')
#   end
# end
