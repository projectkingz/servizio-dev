class BookingsController < ApplicationController

  before_action :authenticate_user!, except: [:accept, :reject, :is_authorised]
  before_action :set_booking, only: [:show, :accept, :edit, :update, :withdraw, :reject, :is_authorised, :destroy]
  #before_action :is_authorised, only: [:accept, :reject]

  def create
    off = Offer.find(booking_params[:offer_id])

    @booking = current_user.bookings.build(booking_params)


    # if off && off.trade_id == current_user.id
    if off && off.trade_id == 100
      redirect_to request.referrer, alert: "You cannot book your own offer"
    elsif Booking.exists?(client_id: current_user.id, offer_id: booking_params[:offer_id], status: booking_params[:status])
      redirect_to request.referrer, alert: "You can only booking one offer at a time"
    elsif (off)
      booking = @booking
      charge(off, booking)
    else
      redirect_to request.referrer, flash: { error: @booking.errors.full_messages.join(', ')}
    end
  end

  def show
  end

  def edit
  end

  def update
    if @booking.pending?
      if @booking.update(booking_params)
        charge(off, booking)
        redirect_to my_bookings_path
        flash[:notice] = "Your changes have been saved..."
      else
        redirect_to request.referrer
        flash[:alert] = "No changes made...."
      end
    elsif @booking.withdraw?
      if @booking.update(booking_params)
        redirect_to my_bookings_path
        flash[:notice] = "Your changes have been saved..."
        @booking.pending!
      else
        redirect_to request.referrer
        flash[:alert] = "No changes made...."
      end
    elsif @booking.reschedule?
      if @booking.update(booking_params)
        redirect_to my_bookings_path
        flash[:notice] = "Your changes have been saved..."
        @booking.pending!
      else
        redirect_to request.referrer
        flash[:alert] = "No changes made...."
      end
    else
      redirect_to request.referrer
      flash[:alert] = "No changes made...."
    end
  end



  def accept
    if @booking.pending?
        @booking.accepted!
        flash[:notice] = "Accepted..."
    end
    redirect_to request.referrer
  end

  def reject
    if @booking.pending?
        @booking.rejected!
        flash[:alert] = "Rejected..."
    end
    redirect_to request.referrer
  end

  def withdraw
    if @booking.pending? || @booking.accepted?
      @booking.withdrawn!
      flash[:alert] = "Booking cancelled..."
    end
    redirect_to my_bookings_path
  end


  def destroy
    if @booking.destroy
      flash[:success] = "Booking Cancelled"
      redirect_to request.referrer
    else
      flash[:notice] = "Unable To Amend"
      redirect_to request.referrer
    end
  end

  def my_bookings
    @bookings = current_user.bookings
  end

  def booking_params
    params.require(:booking).permit(:note, :status, :booking_date, :offer_id, :client_id, :booking_expiry, :client_name, :supplier_name, :complete_by_date, :supplier_id, :client_id, :tip_offered)
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
    @offer = @booking.offer
  end

  def is_authorised
    redirect_to root_path, alert: "You dont have permission" unless current_user.id == @booking.offer.client_id
  end

  def charge(off, booking)
    #booking = off.bookings.new
    booking.note = booking.note
    booking.tip_offered = booking.tip_offered
    booking.status = booking.status
    booking.complete_by_date = Date.today()
    booking.booking_date = Date.today()
    booking.booking_expiry = Date.today()

    #booking.title = off.title
    booking.client_name = current_user.username
    booking.client_id = current_user.id
    booking.supplier_name = off.trade.username
    booking.supplier_id = off.trade_id

    if booking.save
      flash[:notice] ="Your booking has been saved for review"
      redirect_to my_bookings_path
      #, notice: "Saved..."
    else
      flash[:alert] = booking.errors.full_messages.join(', ')
    end
  end



end
