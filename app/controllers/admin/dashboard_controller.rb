class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  def index
    @users = User.all
    @error_reports = ErrorReport.all
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'Bu sayfaya erişim yetkiniz yok.'
    end
  end
end 