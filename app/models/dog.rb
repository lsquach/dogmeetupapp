class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :dog_meetups
  has_many :meetups, through: :dog_meetups
end
