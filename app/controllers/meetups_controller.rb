class MeetupsController < ApplicationController
  def index
    @meetups = Meetup.all
    render :index
  end
end
