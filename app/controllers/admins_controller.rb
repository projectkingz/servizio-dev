class AdminsController < ApplicationController

  before_action :authenticate_admin!

  def dashboard
  end

  ####################################################################################
    def show
      @admin = Admin.find(params[:id])
      #@admin_listings = @admin.listings.paginate(:page => params[:page], :per_page => 5)
    end

    def index
      @admin = admin.paginate(:page => params[:page], :per_page => 5 )
    end

    def set_admin
      @admin = admin.find(params[:id])
    end
  #####################################################################################

  def update
    @admin = current_admin
    if @admin.update_attributes(current_admin_params)
      flash[:notice] = "Saved"

    else
      flash[:alert] = "Cannot update..."

    end
    redirect_to admins_dashboard_path
  end

  private
  def current_admin_params
    params.require(:admin).permit(:from, :about, :status, :language, :avatar)
  end
end
