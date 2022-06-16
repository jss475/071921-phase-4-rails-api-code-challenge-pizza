class RestaurantPizzasController < ApplicationController

    def create
        rp = RestaurantPizza.create(rp_params)
        if rp.valid?
            render json: rp, status: :created
        else
            
            render json: {errors: ["validation errors"]}, status: 422
        end
    end

    private

    def rp_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
end
