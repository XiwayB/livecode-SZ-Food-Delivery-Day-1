require_relative 'base'

class Meal < Base
  attr_accessor :id, :name, :price

  def initialize(attributes = {})
    super(attributes)
    @name = attributes[:name]
    @price = attributes[:price].to_i
  end
end
