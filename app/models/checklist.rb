# User's checklist based on checklist template
class Checklist < ApplicationRecord
  belongs_to :checklist_template
  has_many :item_results
end
