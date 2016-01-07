class Invoice < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  belongs_to :customer
  belongs_to :merchant
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items

  def random_invoice
    self.order("RANDOM()").first
  end

  def self.pending
    joins(:transactions).where(transactions: { result: "failed" })
  end
end
