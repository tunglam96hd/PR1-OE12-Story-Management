class StoryController < ApplicationController
  before_action :load_member, only: %i(show)

  def show; end

  def index; end

  def new; end

  private

  def load_story
    @story = story.find_by id: params[:id]
    return if @story
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end
end
