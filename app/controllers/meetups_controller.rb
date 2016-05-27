class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
  end

  def show
    if current_user
      @meetup = Meetup.find_by_id(params[:id])
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


  private

  def meetup_params
    params.require(:meetup).permit(:description, :location, :address, :name, :time, :meetup_date, :user_id)
  end

  def set_user
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

end
