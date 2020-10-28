# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #include Accessible
  #skip_before_action :check_user, only: :destroy

  before_action :configure_sign_in_params, only: [:create]

  before_action :require_same_user, only: [:edit, :update]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def edit
    super
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def after_sign_in_path_for(resource)
    flash[:success] = "You have successfully logged in"
    user_path(current_user[:id])
  end

  def require_same_user
    if current_user != @user and !current_admin
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
end
