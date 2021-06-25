require "csv"
require_relative "../models/meal"
require_relative "base_repository"

class MealRepository < BaseRepository

  def load_csv
    super(Meal)
  end

end
