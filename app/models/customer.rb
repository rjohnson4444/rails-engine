class Customer < ActiveRecord::Base
  default_scope -> { order('id DESC') }
  has_many :invoices
  has_many :transactions

  def ramdom_customer
    self.order("RANDOM()").first
  end
end
