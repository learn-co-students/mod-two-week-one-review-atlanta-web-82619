class SeasController < ApplicationController
  #define your controller actions here
  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def create
    # byebug
    @sea = Sea.new
    @sea.name = params[:sea][:name]
    @sea.temperature = params[:sea][:temperature]
    @sea.bio = params[:sea][:bio]
    @sea.image_url = params[:sea][:image_url]
    @sea.mood = params[:sea][:mood]
    @sea.favorite_color = params[:sea][:favorite_color]
    @sea.scariest_creature = params[:sea][:scariest_creature]
    @sea.has_mermaids = params[:sea][:has_mermaids]
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
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
