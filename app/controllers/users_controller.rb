class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

      if @user.save
        redirect_to_ root_url 
      else
        render :new
      end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
