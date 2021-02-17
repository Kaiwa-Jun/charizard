class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(hoge_url, notice: 'ログインしました')
    else
      flash[:alert] = 'ログイン失敗'
      render :new
    end
  end

  def destory
    logout
    redirect_to(:users, notice: 'ログアウトしました')
  end
end