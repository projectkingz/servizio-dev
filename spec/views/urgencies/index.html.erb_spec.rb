require 'rails_helper'

RSpec.describe "urgencies/index", type: :view do
  before(:each) do
    assign(:urgencies, [
      Urgency.create!(),
      Urgency.create!()
    ])
  end

  it "renders a list of urgencies" do
    render
  end
end
