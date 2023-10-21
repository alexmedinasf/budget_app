require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  # Validation Tests
  describe 'validations' do
    it 'validates presence of name' do
      user.name = nil
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates the length of name' do
      user.name = 'a' * 81
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("is too long (maximum is 80 characters)")
    end
  end

  # Association Tests
  describe 'associations' do
    it 'should have many entities' do
      expect(User.reflect_on_association(:entities).macro).to eq :has_many
    end

    it 'should have many groups' do
      expect(User.reflect_on_association(:groups).macro).to eq :has_many
    end
  end

  # Instance Tests
  describe 'attributes' do
    it 'name should have a correct value' do
      expect(user.name).to be_present
    end

    # You might not want to directly test Devise's email and password functionalities
    # because they're already well-tested in the Devise gem. But for the sake of example:
    it 'email should be present' do
      expect(user.email).to be_present
    end

    it 'password should be present' do
      expect(user.encrypted_password).to be_present
    end
  end

end
