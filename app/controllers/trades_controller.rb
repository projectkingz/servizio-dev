class TradesController < ApplicationController

  before_action :authenticate_trade!

  def dashboard
  end

  ####################################################################################
    def show
      @trade = Trade.find(params[:id])
      #@trade_listings = @trade.listings.paginate(:page => params[:page], :per_page => 5)
    end

    def index
      @trade = trade.paginate(:page => params[:page], :per_page => 5 )
    end

    def set_trade
      @trade = trade.find(params[:id])
    end
  #####################################################################################

  def update
    @trade = current_trade
    if @trade.update_attributes(current_trade_params)
      flash[:notice] = "Saved"

    else
      flash[:alert] = "Cannot update..."

    end
    redirect_to trades_dashboard_path
  end

  private
  def current_trade_params
    params.require(:trade).permit(:from, :about, :status, :language, :avatar)
  end
end
