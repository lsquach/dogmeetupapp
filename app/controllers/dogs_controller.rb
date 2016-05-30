class DogsController < ApplicationController

  def show
  end

  def edit
  end

  def new
    if current_user
      @dog = Dog.new
    else
      redirect_to root_path
    end
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to user_path(current_user)
      flash[:notice] = "Dog saved"
    else
      flash[:error] = dog.errors.full_messages.join(", ")
      redirect_to to new_user_dog_path
    end
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :image, :age, :size, :breed, :bio, :user_id)
  end

end
