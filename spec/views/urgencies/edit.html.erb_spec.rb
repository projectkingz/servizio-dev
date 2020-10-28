require 'rails_helper'

RSpec.describe "urgencies/edit", type: :view do
  before(:each) do
    @urgency = assign(:urgency, Urgency.create!())
  end

  it "renders the edit urgency form" do
    render

    assert_select "form[action=?][method=?]", urgency_path(@urgency), "post" do
    end
  end
end
