# frozen_string_literal: true


class Admins::SessionsController < Devise::SessionsController
  #include Accessible
  #skip_before_action :check_user, only: [:edit, :update, :destroy]

  before_action :configure_sign_in_params, only: [:create]

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
   #protected

   def after_sign_in_path_for(resource)
     flash[:success] = "You have successfully logged in"
     admin_path(current_admin[:id])
   end



end
