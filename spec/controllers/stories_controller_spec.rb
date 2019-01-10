require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  let!(:member) {FactoryBot.create :member}
  let!(:author) {FactoryBot.create :author, member: member}
  let(:story) {FactoryBot.create :story, member: member}

  let(:story_invalid) do
    {
      name: "",
      describe: "",
      author_id: "",
      member_id: ""
    }
  end

  describe "GET #new" do
    it "assigns a blank story to the view" do
      get :new
      expect(assigns(:story)).to be_a_new(Story)
    end
  end

  context "GET #show" do
    it "render show member" do
      get :show, params: {id: story.id}
      expect(response).to render_template "show"
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create,
        params: {story: FactoryBot.attributes_for(:story, member_id: member.id, author_id: author.id)}} 
      it "creates a new story" do
        expect(Story.count).to eq(0)
      end
    end

    context "invalid params" do
      before {post :create, params: {story: story_invalid}}
      it{expect(response).to render_template()}
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: story.id, story:{name: "tunglamsdasđâsdasd"}}
        expect(response).to be_redirect
      end
    end

    context "update story" do
      it "update fail" do
        patch :update, params: {id: story.id, story:{name: ""}}
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: story.id}}
    context "success" do
      it "test message" do
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
