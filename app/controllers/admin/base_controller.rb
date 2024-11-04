class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin
  layout 'admin'

  private

  def ensure_admin
    unless current_user.admin?
      redirect_to root_path, alert: 'Yetkisiz erişim'
    end
  end
end 