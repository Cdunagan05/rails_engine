# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

require 'csv'

desc 'This imports all the csv files'
task import_files: ["import_files:import_customers",
                    "import_files:import_invoice_items",
                    "import_files:import_invoices",
                    "import_files:import_items",
                    "import_files:import_merchants",
                    "import_files:import_transactions"]

namespace :import_files do
  task :import_customers => [:environment] do
    file = File.read('db/raw_data/customers.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Customer.create!(row.to_hash)
    end
  end
  task :import_invoice_items => [:environment] do
    file = File.read('db/raw_data/invoice_items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end
  task :import_invoices => [:environment] do
    file = File.read('db/raw_data/invoices.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Invoice.create!(row.to_hash)
    end
  end
  task :import_items => [:environment] do
    file = File.read('db/raw_data/items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Item.create!(row.to_hash)
    end
  end
  task :import_merchants => [:environment] do
    file = File.read('db/raw_data/merchants.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end
  end
  task :import_transactions => [:environment] do
    file = File.read('db/raw_data/transactions.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Transactions.create!(row.to_hash)
    end
  end
end

Rails.application.load_tasks
