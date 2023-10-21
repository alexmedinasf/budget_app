require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  # Validation tests
  describe 'validations' do
    it 'validates presence of name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'validates length of name' do
      group.name = 'a' * 81
      expect(group).to_not be_valid
    end
  end

  # Association tests
  describe 'associations' do
    it 'belongs to a user' do
      association = Group.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many entities' do
      association = Group.reflect_on_association(:entities)
      expect(association.macro).to eq :has_many
    end
  end

  # Instance method tests (if any)
  # describe 'instance methods' do
  #   it 'does something specific' do
  #     expect(group.some_method).to eq(expected_result)
  #   end
  # end
end
