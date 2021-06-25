class Router

  def initialize(meal_controller, customer_controller)
    @meal_controller = meal_controller
    @customer_controller = customer_controller
    @running = true
  end

  def run
    puts "Welcome to the Food develivery"
    puts "-----------------"

    while @running
      display_actions
      action = gets.chomp.to_i
      select_action(action)
    end
  end

  private

  def display_actions
    puts "-----------------------"
    puts "What do you want to do?"
    puts "1 - Add a new meal"
    puts "2 - Display all meals"
    puts "3 - Delete a meal"
    puts "4 - Edit a meal"
    puts "5 - Add a customer"
    puts "6 - Display all customers"
    puts "7 - Delete a customer"
    puts "8 - Edit a customer"
    puts "9 - Exit"
  end


  def select_action(action)
    case action
    when 1 then @meal_controller.add
    when 2 then @meal_controller.list
    when 3 then @meal_controller.destroy
    when 4 then @meal_controller.edit
    when 5 then @customer_controller.add
    when 6 then @customer_controller.list
    when 7 then @customer_controller.destroy
    when 8 then @customer_controller.edit
    when 9 then stop
    end
  end

  private

  def stop
    @running = false
  end
end
