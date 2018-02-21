class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
     @user = User.find(params[:id])
     respond_to do |format|
       format.html { render :show }
       format.json { render json: @user}
     end
   end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
      log_in @user
      flash[:success] = "welcome!"
    else
      redirect_to home
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :password_digest, :income, :zipcode)
  end

   def logged_in_user
     unless logged_in?
       flash[:danger] = "please log in"
       redirect_to login_url
     end
   end

   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless @user == current_user
   end
end
