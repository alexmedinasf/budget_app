require 'rails_helper'

RSpec.describe 'devise/registrations/new.html.erb', type: :view do
  before do
    # Stub the `resource`, `resource_name`, and `devise_mapping` methods.
    view.define_singleton_method(:resource) do
      User.new # Change this to your Devise model if it's not User.
    end

    view.define_singleton_method(:resource_name) do
      :user # Change this symbol if you're using a different Devise model.
    end

    view.define_singleton_method(:devise_mapping) do
      Devise.mappings[:user] # Change :user to your Devise model if it's different.
    end

    # Assuming Devise uses the User model, and it has the mentioned fields.
    # Adjust accordingly if you have a different model or fields.
    assign(:user, User.new)

    render
  end

  it 'displays the CashTrack title' do
    expect(rendered).to have_selector('h1', text: 'CashTrack')
  end

  it 'displays the Sign up title' do
    expect(rendered).to have_selector('h2', text: 'Sign up')
  end

  it 'renders error messages' do
    expect(rendered).to render_template(partial: 'devise/shared/error_messages', locals: [{ resource: User.new }])
  end

  it 'renders the form' do
    expect(rendered).to have_selector('form')
    expect(rendered).to have_selector("input[type=text][name='user[name]']")
    expect(rendered).to have_selector("input[type=email][name='user[email]']")
    expect(rendered).to have_selector("input[type=password][name='user[password]']")
    expect(rendered).to have_selector("input[type=password][name='user[password_confirmation]']")
  end

  it 'renders shared Devise links' do
    expect(rendered).to render_template(partial: 'devise/shared/_links')
  end
end
