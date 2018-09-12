require 'rails_helper'

RSpec.describe ChecklistTemplate, type: :model do
  it { should have_many(:items).through(:checklist_templates_items) }
end
