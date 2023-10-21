require 'rails_helper'

RSpec.describe 'landing/index.html.erb', type: :view do
  context 'landing page content' do
    it 'displays the CashTrack title' do
      render
      expect(rendered).to have_content 'CashTrack'
    end

    it 'has a link to the sign in page' do
      render
      expect(rendered).to have_link('Sign In', href: new_user_session_path)
    end

    it 'has text about checking outgoings' do
      render
      expect(rendered).to have_content('Want to check your outgoings?')
    end

    it 'has a link to the sign up page' do
      render
      expect(rendered).to have_link('Sign Up!', href: new_user_registration_path)
    end
  end
end
