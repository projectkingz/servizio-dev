require 'rails_helper'
require 'spec_helper'
require 'rspec/rails'

RSpec.describe "SignInSpec", type: :request do
  it 'test user when attempting to sign in' do
    user = FactoryGirl.create(:user)
    visit root_path(user)
    click_link "Sign in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log in"
    #current_path.should eq('users/signin')
    page.should have_content("You have successfully logged in")

  end

end
