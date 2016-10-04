class Api::V1::CustomersController < ApplicationController

  def index
    render json: Customer.all
  end

  def show
    render json: Customer.find(params[:id])
  end

end

# require 'csv'
#
# desc "Import customers from csv file"
# task :import, [:file_path] => [:environment] do |_, args|
#
#   file = File.read(args.file_path)
#
#   csv = CSV.parse(file, :headers => true)
#   csv.each do |row|
#     Customer.create!(row.to_hash)
#   end
#
# end
