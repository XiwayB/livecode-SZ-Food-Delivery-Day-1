class Base
  def initialize(attributes ={})
    @id = attributes[:id].to_i
  end

  def iv_names
    # meal = Meal.new(id: 1, name: "rice", price: 2)
    # meal.iv_names => ["id", "name", "price"]
    array = []
    self.instance_variables.each do |i|
      i = i.to_s
      i[0] = ''
      array << i
    end
      array
  end

  def iv_values
    # meal.iv_names => ["id", "name", "price"]
    # [meal.id, meal.name, meal.price]
    array = []
    iv_names.each do |i| #=>  ["id", "name", "price"]
    array << self.send(i)
    end
    array
  end
end
