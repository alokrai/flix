class UsersController < ApplicationController

  before_action :require_signin, except: %i[new create]
  before_action :require_correct_user, only: %i[edit update destroy]
  before_action :require_admin, only: %i[destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @favorite_movies = @user.favorite_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit; end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_url, alert: "Account successfully deleted!"
  end

  private

  def user_params
    params[:user].permit(:name, :username, :email, :password, :password_confirmation)
  end

end
