class UsersController < ApplicationController

  before_action :set_user, only: [:index, :edit, :update] 

  def index
    @users = User.all
    render :show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.valid?
        p "created"
        format.html { render :new, notice: 'User was successfully created.' }
        format.json { render json: {msg: "Success"}, status: 200 }
      else
        p "not created"
        format.html { render :new, notice: "#{@user.errors.full_messages}"}
        format.json { render json: @user.errors, status: 400 }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :password)
  end
end