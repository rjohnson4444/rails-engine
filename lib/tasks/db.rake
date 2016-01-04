require "csv"

namespace :db do
  desc "Import csv files into the database"
  task import: :environment do
    customers = parse_csv("#{Rails.root}/lib/assets/customers.csv")

    import_customers(customers)

  end
end

def parse_csv(filename)
  CSV.read(filename, headers: true, header_converters: :symbol)
     .map(&:to_h)
end

def import_customers(customers)
  customers.each do |customer|
    customer = Customer.create!(first_name: customer[:first_name],
                     last_name: customer[:last_name],
                     created_at: customer[:created_at],
                     updated_at: customer[:updated_at]
                     )
    puts "Customer #{customer.first_name} created"
  end
end
