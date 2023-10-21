require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe '#after_sign_in_path_for' do
    let(:user) { create(:user) }

    it 'redirects to the groups path' do
      sign_in user
      expect(controller.after_sign_in_path_for(user)).to eq(groups_path(user))
    end
  end
end
