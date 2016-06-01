class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all.order('meetup_date ASC')

  end

  def show
    if current_user
      @meetup_id = set_meetup
      user_id = @meetup_id.user_id
      @organizer = User.find_by_id(user_id)
      user_dogs = User.find_by_id(current_user)
      @dogs = user_dogs.dogs
      @meetup_dogs = @meetup_id.dogs
    else
      redirect_to root_path
    end
  end

  def add_dog
    meetup_id = set_meetup
    owner_dogs = Dog.find(params[:dog_ids])
    meetup_id.dogs.push(owner_dogs)
    redirect_to meetup_path(meetup_id)
  end

  def remove_dog
    dog_id = Dog.find_by_id(params[:id])
    meetup = Meetup.find_by_id(params[:meetup_id])
    @owner_dogs = meetup.dogs
    @owner_dogs.delete(dog_id)
    redirect_to meetup_path(meetup)
  end

  def new
    if current_user
      @meetup = Meetup.new
    else
      redirect_to root_path
    end
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user = current_user
    if @meetup.save
      redirect_to @meetup
      flash[:notice] = "Meetup saved"
    else
      flash[:error] = meetup.errors.full_messages.join(", ")
      redirect_to new_user_meetup_path
    end
  end

  def edit
      set_meetup
  end

  def update
    meetup = set_meetup
    if meetup.update_attributes(meetup_params)
      redirect_to meetup_path(meetup)
      flash[:notice] = "Meetup updated"
    else
      flash[:error] = meetup.errors.full_messages.join(", ")
      redirect_to edit_meetup(meetup)
    end
  end

  def destroy
    meetup_id = set_meetup
    meetup_dogs = meetup_id.dogs
    meetup_dogs.destroy_all
    meetup_id.destroy
    flash[:notice] = "Meetup deleted"
    redirect_to root_path
  end

  private

  def meetup_params
    params.require(:meetup).permit(:description, :location, :address, :name, :time, :meetup_date, :user_id)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end

  def set_meetup
    @meetup = Meetup.find_by_id(params[:id])
  end
end
