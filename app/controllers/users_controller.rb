class UsersController < ApplicationController
  before_filter :set_user, except: [:new, :create]
  before_filter :logged_in?, except: [:show, :new, :create]
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messges.join(", ")
      redirect_to signup_path
    end
  end

  def show
    if current_user
      set_user
    else
      redirect_to root_path
    end
  end

  def edit
    unless current_user == @user
      redirect_to user_path(current_user)
    end
  end

  def update
    set_user
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:notice] = "Profile updated"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

end
