class ApplicationController < ActionController::Base
  before_action :require_login #ログインしてないユーザのアクセス制限


  protect_from_forgery with: :exception

  private
  def not_authenticated
    redirect_to login_path, alert: "please login first"
  end
end
