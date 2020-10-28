class UsersController < ApplicationController

  before_action :authenticate_user!

  def dashboard

  end

  def show
    @user = User.find(params[:id])
    @user_listings = @user.listings.paginate(:page => params[:page], :per_page => 5)


    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :username, :email, :password, :password_confirmation)}
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    end

  #  The path used after sign up.
    def after_sign_up_path_for(resource)
      root
    end

    def after_sign_in_path_for(resource)
      users_dashboard_path
    end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

  end

  def index
    @user = User.paginate(:page => params[:page], :per_page => 5 )
  end

  def set_user
    @user = User.find(params[:id])
  end


  def update
    @user = current_user
    if @user.update_attributes(current_user_params)
      flash[:notice] = "Saved"
    else
      flash[:alert] = "Cannot update..."
    end
    redirect_to users_dashboard_path
  end

  private
  def current_user_params
    params.require(:user).permit(:from, :about, :status, :language, :avatar, address_attributes: [:client_id, :address_street_number, :address_street_name, :address_town, :address_city, :address_post_code, :address_country, contact_attributes: [:client_id , :full_name, :first_name, :last_name, :home_phone, :mobile_phone, :work_phone]])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  protected
end
