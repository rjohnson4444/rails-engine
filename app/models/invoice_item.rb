class InvoiceItem < ActiveRecord::Base
  default_scope -> { order('id DESC') }
  belongs_to :item
  belongs_to :invoice

  before_create :convert_to_dollars

  def convert_to_dollars
    self.unit_price = (unit_price / 100)
  end

  def self.random_invoice_item
    offset(rand(Merchant.count)).first    
  end
end
