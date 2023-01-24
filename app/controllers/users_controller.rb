class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource, except = [:index, :new ]
  
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  # Show User
  def show
  end

  # Create User
  def new
    @user = User.new
  end

  # Create and save user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Edit User
  def edit
  end

  # Edit and save user
  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete User
  def destroy
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :contact, :age, :gender, :role, :role_id)
  end
end
