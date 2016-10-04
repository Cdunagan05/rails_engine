# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

require 'csv'

namespace :import_files do
  task :import => [:environment] do
    file = File.read('db/raw_data/customers.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Customer.create!(row.to_hash)
    end
  end
  task :import => [:environment] do
    file = File.read('db/raw_data/invoice_items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end
  desc "Import customers from csv file"
  task :import => [:environment] do
    file = File.read('db/raw_data/invoices.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Invoice.create!(row.to_hash)
    end
  end
  desc "Import customers from csv file"
  task :import => [:environment] do
    file = File.read('db/raw_data/items.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Item.create!(row.to_hash)
    end
  end
  desc "Import customers from csv file"
  task :import => [:environment] do
    file = File.read('db/raw_data/merchants.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end
  end
  desc "Import customers from csv file"
  task :import => [:environment] do
    file = File.read('db/raw_data/transactions.csv')
    csv = CSV.parse(file, :headers => true)
    csv.each do |row|
      Transactions.create!(row.to_hash)
    end
  end
end

Rails.application.load_tasks
