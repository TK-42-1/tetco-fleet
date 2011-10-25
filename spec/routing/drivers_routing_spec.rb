require "spec_helper"

describe DriversController do
  describe "routing" do

    it "routes to #index" do
      get("/drivers").should route_to("drivers#index")
    end

    it "routes to #new" do
      get("/drivers/new").should route_to("drivers#new")
    end

    it "routes to #show" do
      get("/drivers/1").should route_to("drivers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/drivers/1/edit").should route_to("drivers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/drivers").should route_to("drivers#create")
    end

    it "routes to #update" do
      put("/drivers/1").should route_to("drivers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/drivers/1").should route_to("drivers#destroy", :id => "1")
    end

  end
end
