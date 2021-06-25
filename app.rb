require_relative './repositories/meal_repository'
require_relative './controllers/meals_controller'
require_relative './repositories/customer_repository'
require_relative './controllers/customer_controller'
require_relative 'router'

meals_csv_file = File.join(__dir__, './data/meals.csv')
customers_csv_file = File.join(__dir__, './data/customers.csv')

meals = MealRepository.new(meals_csv_file)
customers = CustomerRepository.new(customers_csv_file)

meals_controller = MealsController.new(meals)
customers_controller = CustomerController.new(customers)

router = Router.new(meals_controller, customers_controller)

# Start the app
router.run
