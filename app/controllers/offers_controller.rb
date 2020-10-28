class OffersController < ApplicationController

  before_action :authenticate_trade!, except: [:show]
  before_action :set_offer, except: [:new, :create, :index, :list, :bookings]
  before_action :is_authorised, only: [:edit, :update, :destroy, :bookings, :is_authorised]
  before_action :set_categories, only: [:new, :edit, :list]

  def index
    @offers = current_trade.offers
  end

  def new
    @offer = current_trade.offers.build(offer_params)
  end

  def create
    @offer = current_trade.offers.build(offer_params)
    if @offer.save
      redirect_to offers_path, notice: "Saved...."
    else
      redirect_to request.referrer, flash: {error: @offer.errors.full_messages.join(', ')}
    end
  end

  # def accept
  #   if @offer.pending?
  #       @offer.accepted!
  #       flash[:notice] = "Accepted..."
  #   end
  #   redirect_to request.referrer
  # end
  #
  # def reject
  #   if @offer.pending?
  #       @offer.rejected!
  #       flash[:notice] = "Rejected..."
  #   end
  #   redirect_to request.referrer
  # end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to offers_path, notice: "Saved...."
    else
      redirect_to offer.referrer, flash: {error: @offer.errors.full_messages.join(', ')}
    end
  end

  def show
  end

  def destroy
  end

  def list
    @category_id = params[:category]

    if @category_id.present?
      @offers = Offer.where(category_id: @category_id)
    else
      @offers = Offer.all
    end
  end

  def bookings
    @bookings = @offer.bookings
  end

  private

  def set_categories
    @categories = Category.all
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def is_authorised
    @offer = Offer.find(params[:id])
    redirect_to root_path, alert: "You dont have permission" unless current_trade.id == @offer.supplier_id
  end

  def offer_params
    params.permit(:description, :category_id, :delivery, :price, :discount_offer, :valid_from, :valid_to, :attachment_file, :title, :supplier_id)
  end

end
