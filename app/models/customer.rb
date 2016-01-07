class Customer < ActiveRecord::Base
  default_scope -> { order('id DESC') }
  has_many :invoices
  has_many :transactions, through: :invoices

  def ramdom_customer
    self.order("RANDOM()").first
  end

  def favorite_merchant
    Merchant.joins(:invoices, :transactions)
           .unscope(:order)
           .where("invoices.customer_id = ? AND transactions.result = 'success'", id)
           .group("id")
           .order('count(invoices.merchant_id) DESC')
           .first
  end
end
