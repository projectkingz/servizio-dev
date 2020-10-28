require 'rails_helper'

RSpec.describe "urgencies/new", type: :view do
  before(:each) do
    assign(:urgency, Urgency.new())
  end

  it "renders new urgency form" do
    render

    assert_select "form[action=?][method=?]", urgencies_path, "post" do
    end
  end
end
