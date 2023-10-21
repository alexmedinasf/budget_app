require 'rails_helper'

RSpec.describe "entities/index.html.erb", type: :view do
  let(:group1) { create(:group, name: "Group1") }
  let(:group2) { create(:group, name: "Group2") }
  let(:entity1) { create(:entity, name: "Entity1", amount: 100, group_id: group1.id) }
  let(:entity2) { create(:entity, name: "Entity2", amount: 200, group_id: group2.id) }


  before do
    assign(:entities, [entity1, entity2])
    assign(:groups, [group1, group2])
  end

  it 'displays the CashTrack title' do
    render
    expect(rendered).to have_content 'CashTrack'
  end

  it 'displays entities with details in the table' do
    render

    expect(rendered).to have_content(group1.name)
    expect(rendered).to have_content(entity1.name)
    expect(rendered).to have_content(entity1.amount)
    expect(rendered).to have_content(entity1.created_at.to_date)

    expect(rendered).to have_content(group2.name)
    expect(rendered).to have_content(entity2.name)
    expect(rendered).to have_content(entity2.amount)
    expect(rendered).to have_content(entity2.created_at.to_date)
  end

  it 'calculates and displays the correct total amount' do
    render
    expect(rendered).to have_content('Total Amout : 300') # sum of entity1 and entity2
  end

  it 'has link to Categories' do
    render
    expect(rendered).to have_link('Categories', href: groups_path)
  end

  it 'has link to sign out' do
    render
    expect(rendered).to have_link('Sign out', href: destroy_user_session_path)
  end

  it 'has link to add a new entity' do
    render
    expect(rendered).to have_link('Add Transaction', href: new_entity_path)
  end
end
