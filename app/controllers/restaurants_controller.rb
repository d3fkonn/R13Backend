class RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    id = params[:id]
    @restaurant = Restaurant.find_by(id: id)
    if @restaurant
      render json: format_restaurants_response(@restaurant)
      return;
    else
      render json: { error: "Restaurant with ID #{id} not found." }, status: :not_found
    end

  end

  

  def format_restaurants_response(restaurant)
         {
        id: restaurant.id,
        user_id: restaurant.user.id,
        user_name: restaurant.user.name,
        restaurant_address: restaurant.address&.street_address,
        address_id: restaurant.address.id,
        restaurant_name: restaurant.name,
        restaurant_email: restaurant.email,
        restaurant_phone: restaurant.phone,
        price_range: restaurant.price_range,
        rating: restaurant.rating,
        active:restaurant.active
      }
  
  end
  
  def show
    @restaurants = Restaurant.all
      render json: @restaurants
      end
  
      def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
