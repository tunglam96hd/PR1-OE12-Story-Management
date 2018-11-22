class MembersController < ApplicationController
  before_action :load_member, only: %i(show)
  
  def show; end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new member_params
    if @member.save
      flash[:success] = t ".welcome"
      redirect_to @member
    else
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit :name, :email, :password,
      :password_confirmation
  end

  def load_member
    @member = Member.find_by id: params[:id]
    return if @member
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end
end
