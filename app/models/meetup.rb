class Meetup < ActiveRecord::Base
  belongs_to :user
  has_many :dog_meetups
  has_many :dogs, through: :dog_meetups

  validates :description, presence: true, length: {
    minimum: 1,
    maximum: 255
  }
  validates :location, presence: true, length: {
    minimum: 1,
    maximum: 255
  }
  validates :address, presence: true, length: {
    minimum: 1,
    maximum: 250
  }
  validates :name, presence: true, length: {
    minimum: 1,
    maximum: 250
  }
  validates :time, presence: true
  validates :meetup_date, presence: true
end
