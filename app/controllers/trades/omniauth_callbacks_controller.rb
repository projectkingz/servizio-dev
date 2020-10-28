class Trades::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @trade = Trade.from_omniauth(request.env["omniauth.auth"])

    if @trade.persisted?
      sign_in_and_redirect @trade, event: :authentication #this will throw if @trade is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_trade_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
