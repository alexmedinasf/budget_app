# spec/controllers/groups_controller_spec.rb

require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group, user: user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "populates an array of groups" do
      get :index
      expect(assigns(:groups)).to eq([group])
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested group to @group" do
      get :show, params: { id: group.id }
      expect(assigns(:group)).to eq(group)
    end

    it "renders the show view" do
      get :show, params: { id: group.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Group to @group" do
      get :new
      expect(assigns(:group)).to be_a_new(Group)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end
  end

    context "with invalid attributes" do
      it "does not save the group" do
        expect {
          post :create, params: { group: attributes_for(:group, name: nil) }
        }.not_to change(Group, :count)
      end

      it "re-renders the new method" do
        post :create, params: { group: attributes_for(:group, name: nil) }
        expect(response).to render_template :new
      end
    end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the group in the database" do
        patch :update, params: { id: group.id, group: attributes_for(:group, name: 'New Group Name') }
        group.reload
        expect(group.name).to eq('New Group Name')
      end

      it "redirects to the group#show" do
        patch :update, params: { id: group.id, group: attributes_for(:group) }
        expect(response).to redirect_to group_path(group)
      end
    end

    context "with invalid attributes" do
      it "does not update the group" do
        patch :update, params: { id: group.id, group: attributes_for(:group, name: nil) }
        group.reload
        expect(group.name).not_to eq(nil)
      end

      it "re-renders the edit method" do
        patch :update, params: { id: group.id, group: attributes_for(:group, name: nil) }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the group" do
      group
      expect {
        delete :destroy, params: { id: group.id }
      }.to change(Group, :count).by(-1)
    end

    it "redirects to groups#index" do
      delete :destroy, params: { id: group.id }
      expect(response).to redirect_to groups_url
    end
  end
end
