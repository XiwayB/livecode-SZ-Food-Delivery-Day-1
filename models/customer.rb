require_relative 'base'

class Customer < Base
  attr_accessor :name, :address, :id

  def initialize(attributes ={})
    super(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
