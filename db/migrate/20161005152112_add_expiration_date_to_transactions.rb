class AddExpirationDateToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :expiration_date, :string
  end
end
