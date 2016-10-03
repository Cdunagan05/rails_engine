# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

require 'csv'

desc "Import customers from csv file"
task :import => [:environment] do

  file = "db/raw_data/customers.csv"

  csv = CSV.parse(file, :headers => true)
  csv.each do |row|
    Customers.create!(row.to_hash)
  end

end

Rails.application.load_tasks
