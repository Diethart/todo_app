# Realization of checklist templates
class ChecklistTemplate < ApplicationRecord
  has_many :items
end
