class Admin::UsersController < Admin::BaseController
  before_action :set_user, except: [:index, :new, :create, :inactive, :admins]

  def index
    @users = User.includes(:surveys)
                 .order(created_at: :desc)
                 .page(params[:page])
  end

  def show
    @activities = @user.activities.order(created_at: :desc).limit(10)
    @surveys = @user.surveys.includes(:responses).limit(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to admin_users_path, notice: 'Kullanıcı başarıyla oluşturuldu'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'Kullanıcı başarıyla güncellendi'
    else
      render :edit
    end
  end

  def activate
    @user.update(active: true)
    redirect_to admin_user_path(@user), notice: 'Kullanıcı aktifleştirildi'
  end

  def deactivate
    @user.update(active: false)
    redirect_to admin_user_path(@user), notice: 'Kullanıcı deaktif edildi'
  end

  def change_role
    if @user.update(role: params[:role])
      redirect_to admin_user_path(@user), notice: 'Kullanıcı rolü güncellendi'
    else
      redirect_to admin_user_path(@user), alert: 'Rol güncellenemedi'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, 
                               :role, :active, :first_name, :last_name)
  end
end 