require 'spec_helper'

describe CategoriesController do

  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "#create" do

    context "Valid category" do

      it "creates a new list" do
        expect {
          post :create, user_id: user.id, category: attributes_for(:category)
        }.to change(Category, :count).by(1)
      end

      it "sets the lists category_uid" do
        post :create, user_id: user.id, category: attributes_for(:category)
        expect(Category.last.category_uid).to_not be_nil
      end

      it "should redirect to the user's page with the new list active" do
        post :create, user_id: user.id, category: attributes_for(:category)
        expect(response).to redirect_to username_category_path(user.slug, Category.last.category_uid)
      end

    end

    context "Invalid category" do

      it "renders the 'new' action" do

      end

    end

  end

end
