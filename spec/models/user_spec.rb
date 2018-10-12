require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_length_of(:password) }
  it { should validate_presence_of(:password_confirmation) }

  describe 'email uniqueness' do
    subject { create(:user) }
    it { should validate_uniqueness_of(:email) }
  end
end
