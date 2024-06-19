class MainController < ApplicationController
before_action :require_user

  def index
    @AllUsers = User.all
    flash[:notice] = 'loggeid in successfully'
  end
  def secret
    if current_user.blank?
      render plain: '401 Unauthorized', status: :unauthorized
    end
  end
end
