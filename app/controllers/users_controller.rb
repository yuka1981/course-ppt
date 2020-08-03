class UsersController < ApplicationController

  # 會員註冊
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # 登入
      session[:user_token] = @user.id
    
      # 去首頁
      redirect_to root_path, notice: "會員註冊成功"
    else
      render :sign_up
    end 
  end


  # 會員登入
  def sign_in

  end


  private
  def user_params
    params.require(:user).permit(:account, :password, :email)
  end
end
