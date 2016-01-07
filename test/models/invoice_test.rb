require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  should belong_to(:customer)
  should belong_to(:merchant)
end
