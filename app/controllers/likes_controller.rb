class LikesController < ApplicationController

  def create
    Like.create(user: current_user, idea_id: Idea.find(params[:id]))
    redirect_to "/bright_ideas"
  end

  def show
    @idea = Idea.find(params[:id])
    @users = Like.where(idea_id: params[:id])
  end
end
