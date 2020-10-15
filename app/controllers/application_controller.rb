class ApplicationController < ActionController::Base
  before_action :user
  def user
    if user_signed_in?
      @user = current_user
    end
  end
end
