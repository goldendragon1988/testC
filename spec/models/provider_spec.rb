require 'rails_helper'

RSpec.describe Provider, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Item model
  it { should belong_to(:user) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:uid) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:uid) }
end
