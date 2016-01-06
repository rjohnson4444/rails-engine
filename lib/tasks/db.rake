require "csv"

namespace :db do
  desc "Import csv files into the database"
  task import: :environment do
    customers     = parse_csv("#{Rails.root}/lib/assets/customers.csv")
    merchant      = parse_csv("#{Rails.root}/lib/assets/merchants.csv")
    items         = parse_csv("#{Rails.root}/lib/assets/items.csv")
    invoices      = parse_csv("#{Rails.root}/lib/assets/invoices.csv")
    transactions  = parse_csv("#{Rails.root}/lib/assets/transactions.csv")
    invoice_items = parse_csv("#{Rails.root}/lib/assets/invoice_items.csv")

    import_customers(customers)
    import_merchants(merchant)
    import_items(items)
    import_invoices(invoices)
    import_transactions(transactions)
    import_invoice_items(invoice_items)
  end
end

def parse_csv(filename)
  CSV.read(filename, headers: true, header_converters: :symbol)
     .map(&:to_h)
end

def import_customers(customers)
  customers.each do |customer|
    customer = Customer.create!(id: customer[:id],
                                first_name: customer[:first_name],
                                last_name: customer[:last_name],
                                created_at: customer[:created_at],
                                updated_at: customer[:updated_at]
                                )
    puts "Customer #{customer.first_name} #{customer.id} created"
  end
end

def import_merchants(merchants)
  merchants.each do |merchant|
    merchant = Merchant.create!(id: merchant[:id],
                                name: merchant[:name],
                                created_at: merchant[:created_at],
                                updated_at: merchant[:updated_at]
                                )
    puts "Merchant #{merchant.name} #{merchant.id} created"
  end
end

def import_items(items)
  items.each do |item|
    item = Item.create!(id: item[:id],
                        name: item[:name],
                        description: item[:description],
                        unit_price: item[:unit_price],
                        merchant_id: item[:merchant_id],
                        created_at: item[:created_at],
                        updated_at: item[:updated_at]
                        )
    puts "#{item.name} #{item.id} created"
  end
end

def import_invoices(invoices)
  invoices.each do |invoice|
    invoice = Invoice.create!(id: invoice[:id],
                              customer_id: invoice[:customer_id],
                              merchant_id: invoice[:merchant_id],
                              status: invoice[:status],
                              created_at: invoice[:created_at],
                              updated_at: invoice[:updated_at]
                              )
    puts "Invoice #{invoice.id} created"
  end
end

def import_transactions(transactions)
  transactions.each do |transaction|
    transaction = Transaction.create!(id: transaction[:id],
                                      invoice_id: transaction[:invoice_id],
                                      credit_card_number: transaction[:credit_card_number],
                                      result: transaction[:result],
                                      created_at: transaction[:created_at],
                                      updated_at: transaction[:updated_at]
                                      )
    puts "Transaction #{transaction.id} created"
  end
end

def import_invoice_items(invoice_items)
  invoice_items.each do |invoice_item|
    invoice_item = InvoiceItem.create!(id: invoice_item[:id],
                                      item_id: invoice_item[:item_id],
                                      invoice_id: invoice_item[:invoice_id],
                                      quantity: invoice_item[:quantity],
                                      unit_price: invoice_item[:unit_price],
                                      created_at: invoice_item[:created_at],
                                      updated_at: invoice_item[:updated_at]
                                      )
    puts "Invoice Item ##{invoice_item.id} created"
  end
end
