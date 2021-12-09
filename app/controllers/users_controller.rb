class UsersController < ApplicationController

  before_action :set_user, only: [:index, :edit, :update]
  before_action :block_member, only: [:new, :create]
  before_action :block_admin, only: [:index, :show]
  def index
    @users = User.all
    render :show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to root_url, alert: 'Successfully created user'
    end
  end

  def show
    # if user doesnt exist, show self
    if @user.blank?
      set_user
    end
  end

  def edit
  end

  def update
  end

  private

  def block_member
    if !(['super_admin', 'admin'].include? current_user.role)
      set_user
      redirect_to root_url 
    end
  end

  def block_admin
    if (['super_admin', 'admin'].include? current_user.role)
      redirect_to root_url 
    end
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :password)
  end
end