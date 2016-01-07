require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  should have_many(:invoices)
  should have_many(:transactions)
end
