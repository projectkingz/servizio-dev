class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.find(params[:client_id])

    @address = @user.send(set_type.pluralize).new

  end


  def edit


  end


  def create
    @user = User.find(params[:client_id])

    @address = @user.send{set_type.pluralize).new(address_params)
    if @address.save
      redirect_to @user, notice: "#{params[:type]} Address was successfully created"
    else
      render :new
    end
  end

  def update
    if @address.update(address_params)
      redirect_to @user, notice: "#{params[:type]} Address was successfully updated"
    else
      render :edit
    end
  end

  def destroy

  end


  private

  def set_address
    @user = User.find(params[:client_id])

    @address = @user.send(set_type.pluralize).find(params[:id])
  end


  def set_type
    case params[:type]
    when 'Business'
      'address_business'
    when 'DropOff'
      'address_dropoff'
    when 'Home'
      'address_home'
    when 'Job'
      'address_job'
    when 'PickUp'
      'address_pickup'
    end
  end

  def address_params
    params.require(set_type.to_sym).permit(:type, :client_id, :address_street_number, :address_street_name, :address_town, :address_city, :address_post_code, :address_country)
  end

end
