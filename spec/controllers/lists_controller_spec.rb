require 'spec_helper'

describe ListsController do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "#create" do

    context "Valid list" do

      it "creates a new list" do
        expect {
          post :create, user_id: user.id, list: attributes_for(:list)
        }.to change(List, :count).by(1)
      end

      it "sets the lists uid" do
        post :create, user_id: user.id, list: attributes_for(:list)
        expect(List.last.uid).to_not be_nil
      end

      it "should redirect to the user's page with the new list active" do
        post :create, user_id: user.id, list: attributes_for(:list)
        expect(response).to redirect_to username_list_path(user.slug, List.last.uid)
      end

    end

    context "Invalid list" do

      it "renders the 'new' action" do

      end

    end

  end

end
