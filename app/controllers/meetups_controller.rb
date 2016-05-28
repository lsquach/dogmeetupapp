class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def show
    if current_user
      @meetup_id = set_meetup
      user_id = @meetup_id.user_id
      @organizer = User.find_by_id(user_id)
    else
      redirect_to root_path
    end
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
