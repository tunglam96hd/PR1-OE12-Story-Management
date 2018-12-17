class ChaptersController < ApplicationController
  before_action :load_chapter, only: %i(show destroy)
  before_action :logged_in_member, :admin_member, only: %i(create destroy)

  def show; end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = current_member.chapters.build chapter_params
    if @chapter.save
      flash.now[:success] = t ".success"
    else
      flash.now[:danger] = t ".failed"
    end
  end

  def destroy
    if @chapter.destroy
      flash.now[:success] = t ".success"
    else
      flash.now[:danger] = t ".failed"
    end
  end

  private
  def chapter_params
    params.require(:chapter).permit :name, :content, :story_id
  end

  def load_chapter
    @chapter = Chapter.find_by id: params[:id]
    return if @chapter
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end

  def admin_member
    redirect_to(root_url) unless current_member.admin?
  end
end
