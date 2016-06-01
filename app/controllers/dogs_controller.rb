class DogsController < ApplicationController

  def show
    if current_user
      dog_id = set_dog
      @dog_meetups = dog_id.meetups
    else
      redirect_to root_path
    end
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
    set_dog
  end

  def update
    dog = set_dog
    if dog.update_attributes(dog_params)
      redirect_to dog_path(dog)
      flash[:notice] = "Dog updated"
    else
      flash[:error] = dog.errors.full_messages.join(", ")
      redirect_to edit_dog(dog)
    end
  end

  def destroy
    @dog = set_dog
    @dog.meetups.destroy_all
    @dog.destroy
    flash[:notice] = "Dog deleted"
    redirect_to user_path(current_user)
  end

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :image, :age, :size, :breed, :bio, :user_id)
  end

  def set_dog
    @dog = Dog.find_by_id(params[:id])
  end

end
