require 'rails_helper'

RSpec.describe ItemResult, type: :model do
  it { should belong_to(:item) }
  it { should belong_to(:checklist) }
end
