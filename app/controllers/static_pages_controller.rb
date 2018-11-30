class StaticPagesController < ApplicationController
  def home
    @stories = Story.all.page(params[:page]).per Settings.paginate.per_page
  end

  def help; end

  def about; end

  def contact; end
end
