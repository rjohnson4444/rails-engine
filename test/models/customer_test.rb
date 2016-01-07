require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  

  test "#favorite_merchant returns a merchant" do
    customer = Customer.first

    binding.pry
    customer.favorite_merchant
  end
end
