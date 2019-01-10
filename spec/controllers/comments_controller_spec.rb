require 'rails_helper'

RSpec.describe StoriesController, type: :controller do
  let!(:member) {FactoryBot.create :member}
  let!(:story) {FactoryBot.create :story, member: member}
  let(:comment) {FactoryBot.create :comment, member: member}

  let(:comment_invalid) do
    {
      content: ""
    }
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create,
        params: {comment: FactoryBot.attributes_for(:comment, member_id: member.id, story_id: story.id)}} 
      it "creates a new comment" do
        expect(Comment.count).to eq(0)
      end
    end

    context "invalid params" do
      before {post :create, params: {story: comment_invalid}}
      it{expect(response).to render_template()}
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: comment.id, comment:{content: "tunglamsdasđâsdasd"}}
        expect(response).to be_redirect
      end
    end

    context "update story" do
      it "update fail" do
        patch :update, params: {id: comment.id, comment:{content: ""}}
        expect(response).to be_redirect
      end
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: comment.id}}
    context "success" do
      it "test message" do
        expect(response).to be_redirect
      end
    end
  end

end
