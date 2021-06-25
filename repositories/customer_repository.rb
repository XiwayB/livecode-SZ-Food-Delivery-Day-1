require "csv"
require_relative "../models/customer"
require_relative "base_repository"

class CustomerRepository < BaseRepository

  def load_csv
    super(Customer)
  end

end
