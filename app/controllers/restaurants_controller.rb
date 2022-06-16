class RestaurantsController < ApplicationController
    def index
        render json: Restaurant.all, status: :ok
    end

    def show
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            render json: restaurant, status: :ok, serializer: IndividualRestaurantSerializer
        else
            render json: {error: "Restaurant not found"}, status: :not_found
        end
    end

    def destroy
        restaurant = Restaurant.find_by(id: params[:id])
        if restaurant
            restaurant.restaurant_pizzas.destroy_all
            restaurant.destroy
            render json: {}, status: 204
        else
            render json: {error: "Restaurant not found"}, status: :not_found
        end
    end
end
