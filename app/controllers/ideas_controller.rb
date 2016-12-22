class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def create
    @users = User.all
    @idea = User.find(current_user).ideas.create(idea: params[:idea])
    redirect_to '/bright_ideas'
  end

  def show
    @ideas = Idea.all
  end

end
