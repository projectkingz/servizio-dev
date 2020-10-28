class AfterRegisterController < Wicked::WizardController

  before_action :authenticate_user!

  steps :add_address

  def show
    @user = current_user

    render_wizard

  end

  def update
    @user = current_user

    @address = @user.address.update_attributes(address_params)
    if @address
      render_wizard @user
      flash[:notice] = "Saved"
    else
      redirect_to request.referrer, flash: { error: @address.errors.full_messages.to_sentence }
    end
  end

  def finish_wizard_path
    after_address_path(:add_contact)
  end

  private

  def address_params
    params.require(:address).permit(:type, :client_id, :address_street_number, :address_street_name, :address_town, :address_city, :address_post_code, :address_county, :address_country)
  end

end
