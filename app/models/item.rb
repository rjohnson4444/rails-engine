class Item < ActiveRecord::Base
  default_scope -> { order('id DESC') }
  belongs_to :merchant
  has_many :invoice_items

  before_create :convert_to_dollars

  def random_item
    offset(rand(Merchant.count)).first    
  end

  def convert_to_dollars
    self.unit_price = (unit_price / 100)
  end
end
