class Merchant < ActiveRecord::Base
  default_scope -> { order('id DESC') }

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.random_merchant
    offset(rand(Merchant.count)).first
  end

  def self.revenue_by_date(date, id)
    { "revenue" => joins(invoices: [:transactions, :invoice_items])
                    .where("transactions.result = ? AND merchants.id = ? AND invoices.created_at = ?", "success", id, date)
                    .sum("invoice_items.quantity * invoice_items.unit_price")
                    }
  end

  def self.revenue(id)
    { "revenue" => joins(invoices: [:transactions, :invoice_items])
                    .where("transactions.result = ? AND merchants.id = ?", "success", id)
                    .sum("invoice_items.quantity * invoice_items.unit_price")
                    }
  end

  def self.all_revenue_by_date(date)
    { "total_revenue" => joins(invoices: [:transactions, :invoice_items])
                          .where("transactions.result = ? AND invoices.created_at = ?", "success", date)
                          .sum("invoice_items.quantity * invoice_items.unit_price")
                          }
  end

  def favorite_customer
    Customer.joins(:invoices, :transactions)
              .unscope(:order)
              .where("invoices.merchant_id = ? AND transactions.result = 'success' ", id)
              .group("id")
              .order('count(invoices.customer_id) DESC')
              .first
  end

  def customers_with_pending_invoices
    need_to_pay = []
    self.invoices.pending.map { |invoice| need_to_pay << invoice.customer }
    need_to_pay.uniq
    # self.invoices.joins(:transactions).where('transactions.result = ?', 'failed').
  end
end
