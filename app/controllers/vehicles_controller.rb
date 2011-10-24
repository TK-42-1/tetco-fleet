class VehiclesController < ApplicationController
  
  def index
    @title = "Vehicle Manager"
    @vehicles = Vehicle.all
  end
  
  def new
    @title = "New Vehicle"
    @vehicle = Vehicle.new
  end
  
  def edit
    @title = "Edit Vehicle"
    @vehicle = Vehicle.find(params[:id])
  end
  
  def show
    @vehicle = Vehicle.find(params[:id])
    @title = "#{@vehicle.year} #{@vehicle.make.capitalize} #{@vehicle.model.capitalize}"
  end
  
  def create
    @vehicle = Vehicle.new(params[:vehicle])
    if @vehicle.save
      redirect_to @vehicle
    else
      @title = "New Vehicle"
      render 'new'
    end
  end
  
  def update
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.update_attributes(params[:vehicle])
      redirect_to @vehicle, flash: {success: "Vehicle Updated"}
    else
      @title = "Edit Vehicle"
      render 'edit'
    end
  end
end
