class RenameExpirationDateInTransactions < ActiveRecord::Migration[5.0]
  def change
    rename_column :transactions, :expiration_date, :credit_card_expiration_date
  end
end
