class User < ActiveRecord::Base
  has_many :submissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  #validates :username, presence: true
  validates :email, presence: true

  def teacher?
  	teacher
  end

  private

  def update_access_token!
  	self.access_token = "#{self.id}:#{Devise.friendly_token}"
  	save
  end

  

end