class InvoiceItem < ApplicationRecord
  default_scope { order('id ASC')}
end
