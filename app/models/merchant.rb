class Merchant < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  has_many :items
  has_many :invoices  

  def ramdom_merchant
    self.order("RANDOM()").first
  end
end
