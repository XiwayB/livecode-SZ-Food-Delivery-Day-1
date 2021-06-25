require_relative "../models/meal"
require_relative "../views/meals_view"
require_relative "base_controller"

class MealsController < BaseController

  def initialize(meals_repository)
    super(meals_repository, MealsView)
  end

  def add
    list
    name = @view.ask_user_for("name")
    price = @view.ask_user_for("price")
    meal = Meal.new(name: name, price: price)
    @repo.create(meal)
    list
  end

  def edit
    list
    meal_index = @view.ask_user_for("number").to_i - 1
    meal_id = @repo.all[meal_index].id
    meal = @repo.find(meal_id)
    name = @view.ask_user_for("name")
    meal.name = name
    price = @view.ask_user_for("price")
    meal.price = price
    @repo.edit(meal)
    list
  end

end
