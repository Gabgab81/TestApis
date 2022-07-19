class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


    def index
        # @restaurants = Restaurant.all
        @restaurants = policy_scope(Restaurant)

        @markers = @restaurants.geocoded.map do |restaurant|
            {
              lat: restaurant.latitude,
              lng: restaurant.longitude,
              info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
            }
        end
    end

    def show
        
    end

    def new
        @restaurant = Restaurant.new
        authorize @restaurant
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.user = current_user
        authorize @restaurant
        if @restaurant.save
            redirect_to restaurants_path
        else
            render :new
        end
    end

    def edit
        
    end

    def update
        if @restaurant.update(restaurant_params)
            redirect_to restaurants_path
        else
            render :edit
        end
    end

    def destroy
        @restaurant.destroy
        redirect_to restaurants_path
    end

    private

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
        authorize @restaurant
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :photo)
    end

end
