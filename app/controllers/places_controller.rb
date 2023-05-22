class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit]

  def index
    @places = Place.all
  end

  def show; end

  def new
    @place = Place.new
  end

  def create
    @place = Place.add_place(place_params[:address], place_params[:date], place_params[:book_id])
    if @place
      redirect_to @place
    else
      flash.now[:alert] = 'This place already exists!'
      @place = Place.new
      render :new
    end
  end

  def edit; end

  def update
    @place = Place.update_place(params[:id], params[:address], place_params[:date], params[:book_id])
    if @place
      redirect_to @place
    else
      flash.now[:alert] = 'This place already exists!'
      set_place
      render :edit
    end
  end

  def destroy
    Place.delete_place_id(params[:id])
    redirect_to places_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:address, :date, :book_id)
  end
end