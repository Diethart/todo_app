require 'rails_helper'

RSpec.describe Checklist, type: :model do
  it { should have_many(:item_results) }
  it { should belong_to(:checklist_template) }
end
