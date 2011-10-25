require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'reports'" do
    it "should be successful" do
      get 'reports'
      response.should be_success
    end
  end

end
