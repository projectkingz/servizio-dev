class AfterAddressController < Wicked::WizardController

  before_action :authenticate_user!

  steps :add_contact

  def show
    @user = current_user

    render_wizard

  end

  def update
    @user = current_user

    @contact = @user.contact.update_attributes(contact_params)
    if @contact
      render_wizard @user
      flash[:notice] = "Saved"
    else
      redirect_to request.referrer, flash: { error: @contact.errors.full_messages.to_sentence }
    end
  end

  def finish_wizard_path
    users_dashboard_path
  end

  private

  def contact_params
    params.require(:contact).permit(:client_id, :first_name, :last_name, :home_phone,:mobile_phone, :work_phone)
  end

end
