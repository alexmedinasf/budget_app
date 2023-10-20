require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @first_user = User.new(name: 'DefaultName', email: 'defaultuser@email.com', password: 'defaultpassword',
                           password_confirmation: 'defaultpassword')
  end

  describe 'When the user model is tested' do
    it 'validates the name of the user' do
      expect(@first_user.valid?).to be true
    end
  end
end
