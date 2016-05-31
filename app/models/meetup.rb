class Meetup < ActiveRecord::Base
  belongs_to :user
  has_many :dog_meetups
  has_many :dogs, through: :dog_meetups
end
