class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
   @user = User.new(user_params) # 
    if @user.save
      #处理正确注册的情况,如果注册成功重定向到主页
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end
end
