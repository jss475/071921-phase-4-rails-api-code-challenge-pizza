class RestaurantPizzaSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients

  def name
    object.pizza.name
  end

  def ingredients
    object.pizza.ingredients
  end
end
