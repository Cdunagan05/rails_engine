class InvoiceItem < ApplicationRecord
  default_scope { order('id ASC')}

  belongs_to :invoice
  belongs_to :item

  def unit_price_with_quantity
    unit_price * quantity
  end
end
