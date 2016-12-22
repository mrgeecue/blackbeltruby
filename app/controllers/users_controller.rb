class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/bright_ideas"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
    @ideas = User.find(params[:id]).ideas
    @likes = User.find(params[:id]).likes
  end

  private
  def user_params
  params.require(:user).permit(:name, :alias, :email, :password)
  end
end
