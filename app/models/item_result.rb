class ItemResult < ApplicationRecord
  belongs_to :checklist
  belongs_to :item
end
