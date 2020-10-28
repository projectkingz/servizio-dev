class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.find(params[:client_id])

    @contact = @user.contact.new

  end


  def edit


  end


  def create
    @user = User.find(params[:client_id])

    @contact = @user.contact.new(contact_params)
    if @contact.save
      redirect_to @user, notice: "#{params[:type]} Contact was successfully created"
    else
      render :new
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @user, notice: "#{params[:type]} Contact was successfully updated"
    else
      render :edit
    end
  end

  def destroy

  end


  private

  def set_contact
    @user = User.find(params[:client_id])

    @contact = @user.contact.find(params[:id])
  end


  def contact_params
    params.require(contact).permit(:client_id, :full_name, :first_name, :last_name, :home_phone, :mobile_phone, :work_phone)
  end

end
