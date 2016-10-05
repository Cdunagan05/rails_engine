class Item < ApplicationRecord
  default_scope { order('id ASC')}
end
