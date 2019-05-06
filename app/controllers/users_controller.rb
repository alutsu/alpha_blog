class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 1)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User updated"
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end