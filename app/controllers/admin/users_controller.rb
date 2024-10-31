class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def update_role
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: 'Kullanıcı rolü güncellendi.'
    else
      redirect_to admin_users_path, alert: 'Güncelleme başarısız!'
    end
  end

  private

  def user_params
    params.require(:user).permit(:role)
  end
end 