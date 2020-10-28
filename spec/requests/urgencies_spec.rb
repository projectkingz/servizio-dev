require 'rails_helper'

RSpec.describe "Urgencies", type: :request do
  describe "GET /urgencies" do
    it "works! (now write some real specs)" do
      get urgencies_path
      expect(response).to have_http_status(200)
    end
  end
end
