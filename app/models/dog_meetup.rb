class DogMeetup < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :dog
end
