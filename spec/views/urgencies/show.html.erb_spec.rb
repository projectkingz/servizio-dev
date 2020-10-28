require 'rails_helper'

RSpec.describe "urgencies/show", type: :view do
  before(:each) do
    @urgency = assign(:urgency, Urgency.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
