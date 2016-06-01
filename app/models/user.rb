class User < ActiveRecord::Base
  has_secure_password
  has_many :dogs
  has_many :meetups

  validates :email, presence: true,
        uniqueness: true, length: {
      minimum: 1,
      maximum: 255
    }

  validates :name, presence: true, length: {
      minimum: 1,
      maximum: 255
    }

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
