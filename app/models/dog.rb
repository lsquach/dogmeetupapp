class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :dog_meetups
  has_many :meetups, through: :dog_meetups

  validates :name, presence: true, length: {
    minimum: 1,
    maximum: 255
  }
  validates :age, presence: true, length: {
    minimum: 1,
    maximum: 2
  }, numericality: { only_integer: true, greater_than: 0 }
  validates :size, presence: true, length: {
    minimum: 1,
    maximum: 250
  }
  validates :bio, presence: true, length: {
    minimum: 1,
    maximum: 1000
  }
  validates :breed, presence: true, length: {
    minimum: 1,
    maximum: 250
  }
end
