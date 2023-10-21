# spec/controllers/entities_controller_spec.rb

require 'rails_helper'

RSpec.describe EntitiesController, type: :controller do
  let(:user) { create(:user) }
  let(:entity) { create(:entity, user: user) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "populates an array of entities" do
      get :index
      expect(assigns(:entities)).to eq([entity])
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested entity to @entity" do
      get :show, params: { id: entity.id }
      expect(assigns(:entity)).to eq(entity)
    end

    it "renders the show view" do
      get :show, params: { id: entity.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Entity to @entity" do
      get :new
      expect(assigns(:entity)).to be_a_new(Entity)
    end

    it "renders the new view" do
      get :new
      expect(response).to render_template :new
    end
  end

    context "with invalid attributes" do
      it "does not save the entity" do
        expect {
          post :create, params: { entity: attributes_for(:entity, name: nil) }
        }.not_to change(Entity, :count)
      end

      it "re-renders the new method" do
        post :create, params: { entity: attributes_for(:entity, name: nil) }
        expect(response).to render_template :new
      end
    end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the entity in the database" do
        patch :update, params: { id: entity.id, entity: attributes_for(:entity, name: 'New Entity Name') }
        entity.reload
        expect(entity.name).to eq('New Entity Name')
      end

      it "redirects to the entity#show" do
        patch :update, params: { id: entity.id, entity: attributes_for(:entity) }
        expect(response).to redirect_to entity_path(entity)
      end
    end

    context "with invalid attributes" do
      it "does not update the entity" do
        patch :update, params: { id: entity.id, entity: attributes_for(:entity, name: nil) }
        entity.reload
        expect(entity.name).not_to eq(nil)
      end

      it "re-renders the edit method" do
        patch :update, params: { id: entity.id, entity: attributes_for(:entity, name: nil) }
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the entity" do
      entity
      expect {
        delete :destroy, params: { id: entity.id }
      }.to change(Entity, :count).by(-1)
    end

    it "redirects to entities#index" do
      delete :destroy, params: { id: entity.id }
      expect(response).to redirect_to entities_url
    end
  end
end
