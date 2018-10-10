require 'rails_helper'

RSpec.describe Checklist, type: :model do
  it { should have_many(:item_results) }
  it { should belong_to(:checklist_template) }
  it { should have_many(:items).through(:item_results) }
  it { should validate_presence_of(:checklist_template_id) }
end
