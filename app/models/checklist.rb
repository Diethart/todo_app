# User's checklist based on checklist template
class Checklist < ApplicationRecord
  belongs_to :checklist_template
  has_many :item_results, dependent: :destroy
  has_many :items, through: :item_results
  validates :title, :checklist_template_id, presence: true
end
