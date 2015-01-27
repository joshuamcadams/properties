class UsersController < ApplicationController

  layout false

  def index
    @users = User.sorted
  end

  def show
     @user = User.find(params[:id])
  end

  def new
     @admin_user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Admin user created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

    def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed"
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
      :title, :email,  :password, :bio)
  end

end
