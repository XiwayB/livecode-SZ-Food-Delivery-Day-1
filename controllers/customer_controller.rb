require_relative "../models/customer"
require_relative "../views/customers_view"
require_relative "base_controller"

class CustomerController < BaseController

  def initialize(customers_repository)
    super(customers_repository, CustomersView)
  end

  def add
    name = @view.ask_user_for("name")
    address = @view.ask_user_for("address")
    customer = Customer.new(name: name, address: address)
    @repo.create(customer)
    list
  end

  def edit
    list
    customer_index = @view.ask_user_for("number").to_i - 1
    customer_id = @repo.all[customer_index].id
    customer = @repo.find(customer_id)
    name = @view.ask_user_for("name")
    customer.name = name
    address = @view.ask_user_for("address")
    customer.address = address
    @repo.edit(customer)
    list
  end

end
