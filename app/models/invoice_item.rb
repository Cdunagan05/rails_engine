class InvoiceItem < ApplicationRecord
  default_scope { order('id ASC')}

  belongs_to :invoice
  belongs_to :item
end
