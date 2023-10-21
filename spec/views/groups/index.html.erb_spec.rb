require 'rails_helper'

RSpec.describe 'groups/index.html.erb', type: :view do
  let(:group1) { create(:group, name: 'Group1') }
  let(:group2) { create(:group, name: 'Group2') }
  let(:entity1) { create(:entity, amount: 100, group_id: group1.id) }
  let(:entity2) { create(:entity, amount: 50, group_id: group1.id) }
  let(:entity3) { create(:entity, amount: 150, group_id: group2.id) }

  before do
    assign(:groups, [group1, group2])
    assign(:entities, [entity1, entity2, entity3])
  end

  it 'displays the CashTrack title' do
    render
    expect(rendered).to have_content 'CashTrack'
  end

  it 'displays group names' do
    render
    expect(rendered).to have_content(group1.name)
    expect(rendered).to have_content(group2.name)
  end

  it 'has link to Transactions' do
    render
    expect(rendered).to have_link('Transactions', href: entities_path)
  end

  it 'has link to sign out' do
    render
    expect(rendered).to have_link('Sign out', href: destroy_user_session_path)
  end

  it 'has link to create a new group' do
    render
    expect(rendered).to have_link('New group', href: new_group_path)
  end
end
