class UsersController < ApplicationController
  load_and_authorize_resource, except = [:index, :new ]
  def index
    @users = User.all
  end

  # Show User
  def show
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])    
  end

  # Edit and save user
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete User
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:name, :contact, :age, :gender, :role, :role_id)
    end
end
