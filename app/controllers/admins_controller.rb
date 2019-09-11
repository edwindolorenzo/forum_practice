class AdminsController < ApplicationController
  before_action :admin!
  def admin!
    unless current_user&.admin?
      redirect_to root_path
    end
  end
end
