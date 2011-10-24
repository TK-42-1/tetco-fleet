require 'spec_helper'

describe VehiclesController do
  render_views
  
  before(:each) do
    @base_title = "TETCO Fleet Management"
    
    @vehicle = Factory(:vehicle)
  end

  describe "index page" do
    
    it "should have the right title" do
      get :index
      response.should have_selector("title", content: @base_title + " | Vehicle Manager")
    end
    
    it "should exist" do
      get :index
      response.should be_success
    end
    
    it "should have a link to add a new vehicle" do
      get :index
      response.should have_selector("a", content: "New Vehicle")
    end
  end
  
  describe "edit page" do
    
    it "should exist" do
      get :edit, id: @vehicle
      response.should be_success
    end
    
    it "should have the right title" do
      get :edit, id: @vehicle
      response.should have_selector("title", content: @base_title + " | Edit Vehicle")
    end
  end
  
  describe "show page" do
    
    it "should exist" do
      get :show, id: @vehicle
      response.should be_success
    end
    
    it "should have the right title" do
      get :show, id: @vehicle
      response.should have_selector("title", 
        content: @base_title + " | " + @vehicle.year.to_s + " " + @vehicle.make.capitalize + " " + @vehicle.model.capitalize)
    end
    
    it "should display the vehicle" do
      get :show, id: @vehicle
      response.should have_selector("h1", 
        content: @vehicle.year.to_s + " " + @vehicle.make.upcase + " " + @vehicle.model.upcase)
    end
  end
  
  describe "new page" do
    
    it "should exist" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", content: @base_title + " | New Vehicle")
    end
  end
  
  describe "create vehicle" do
    
    describe "failure" do
      before(:each) do
        @attr = { plate: "", vin: "", make: "", model: "", year: "", driver_id: "", milage: "", status: "" }
      end
      
      it "should not create a new vehicle" do
        lambda do
          post :create, vehicle: @attr
        end.should_not change(Vehicle, :count)
      end
      
      it "should have the right title" do
        post :create, vehicle: @attr
        response.should have_selector("title", content: "New Vehicle")
      end
      
      it "should show the new form" do
        post :create, vehicle: @attr
        response.should render_template('new')
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = { plate: "RJC324", 
                  vin: "12345678901122331", 
                  make: "donkey", 
                  model: "kong", 
                  year: "1999", 
                  driver_id: "1", 
                  milage: "1231", 
                  status: "Active" }
      end
      
      it "should create a new vehicle" do
        lambda do
          post :create, vehicle: @attr
        end.should change(Vehicle, :count).by(1)
      end
      
      it "should redirect to the new vehicles show page" do
        post :create, vehicle: @attr
        response.should redirect_to(vehicle_path(assigns[:vehicle]))
      end
    end
  end
end
