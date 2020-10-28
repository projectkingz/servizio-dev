require "rails_helper"

RSpec.describe UrgenciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/urgencies").to route_to("urgencies#index")
    end

    it "routes to #new" do
      expect(:get => "/urgencies/new").to route_to("urgencies#new")
    end

    it "routes to #show" do
      expect(:get => "/urgencies/1").to route_to("urgencies#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/urgencies/1/edit").to route_to("urgencies#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/urgencies").to route_to("urgencies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/urgencies/1").to route_to("urgencies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/urgencies/1").to route_to("urgencies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/urgencies/1").to route_to("urgencies#destroy", :id => "1")
    end
  end
end
