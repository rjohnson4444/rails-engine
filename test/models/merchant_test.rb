require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  should have_many(:items)
  should have_many(:invoices)
  should have_many(:transactions)
end
