# Class for representing associated Items of Checklist
class ItemResult < ApplicationRecord
  belongs_to :checklist
  belongs_to :item
end
