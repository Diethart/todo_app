require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should validate_presence_of(:task) }
  it { should validate_length_of(:task) }
  it { should belong_to(:checklist_template) }
end
