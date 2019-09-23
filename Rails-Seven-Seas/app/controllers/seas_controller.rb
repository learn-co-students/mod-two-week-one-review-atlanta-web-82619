class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
  end
  
  def new
    @sea = Sea.new
  end

  def create
    @sea = Sea.new
    @sea.name = params[:name]
    @sea.temperature = params[:temperature]
    @sea.bio = params[:bio]
    @sea.image_url = params[:image_url]
    @sea.mood = params[:mood]
    @sea.favorite_color = params[:favorite_color]
    @sea.scariest_creature = params[:scariest_creature]
    @sea.has_mermaids = params[:has_mermaids]
    @sea.save
    
    redirect_to sea_path(@sea)
  end

  def show
    @sea = Sea.find(params[:id])
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    @sea = Sea.find(params[:id])
    @sea.update(sea_params)
    
    redirect_to sea_path(@sea)
  end

  # def sea_params(*args)
  #   params.require(:sea).permit(*args)
  # end
  def destroy
    @sea = Sea.find(params[:id])
    @sea.destroy
    redirect_to seas_path
  end

  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
