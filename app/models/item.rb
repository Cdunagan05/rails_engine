class Item < ApplicationRecord
  default_scope { order('id ASC')}

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
end
