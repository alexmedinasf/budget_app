# spec/models/entity_spec.rb

require 'rails_helper'

RSpec.describe Entity, type: :model do
  # Let's set up a basic user and entity for use in our tests.
  let(:user) { create(:user) }
  let(:entity) { create(:entity, user: user) }

  # Model associations
  describe 'associations' do
    it 'belongs to a user' do
      expect(entity.user).to eq(user)
    end

  end

  # Validations
  describe 'validations' do
    it 'validates presence of name' do
      entity.name = nil
      expect(entity).to_not be_valid
    end

    it 'validates length of name' do
      entity.name = "a" * 81
      expect(entity).to_not be_valid
    end
  end
end
