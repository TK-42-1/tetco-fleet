class VehiclesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @title = "Vehicle Manager"
    @vehicles = Vehicle.search(params[:search]).order(sort_column + " " + sort_direction).paginate(per_page: 25, page: params[:page])
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
  
  private
  
  def sort_column
    Vehicle.column_names.include?(params[:sort]) ? params[:sort] : "plate"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"   
  end
end
