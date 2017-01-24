class ForumsController < ApplicationController
  def index
    @forums = Forum.all
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(text: params[:text], user_id: current_user.id, image: params[:image], title: params[:title])

    if @forum.save
      flash[:success] = "Thanks for posting!"
      redirect_to "/forums"
    else
      flash[:success] = "Forum post failed to save!"
      render :new
    end
  end
end
