class UsersController < ApplicationController

  # 會員註冊
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # 登入
      sign_in_user(@user)
    
      # 去首頁
      redirect_to root_path, notice: "會員註冊成功"
    else
      render :sign_up
    end 
  end


  # 會員登入
  def sign_in

  end

  def sign_out
    # 把票拿掉就是登出狀態了
    sign_out_user
    redirect_to root_path, notice: "登出成功"
  end


  private
  def sign_in_user(u)
    session[:user_token] = u.id
  end

  def sign_out_user
    session[:user_token] = nil
  end

  def user_params
    params.require(:user).permit(:account, :password, :email)
  end
end
