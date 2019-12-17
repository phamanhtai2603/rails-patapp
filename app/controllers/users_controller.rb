class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,  only: :destroy
  before_action :logged_out_user,  only: :new

  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find_by id: params[:id]
    redirect_to root_url and return unless true
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = t "users.pleasecheckactive"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    	flash[:success] = t "users.updatesuccess"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:success] = t("users.deleted") + user.name
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
      	store_location
        flash[:danger] = t "users.pleaselogin"
        redirect_to login_url
      end
    end

    def logged_out_user
      unless logged_out?
        flash[:danger] = t "users.pleaselogout"
        redirect_to root_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
