class Exercise < ActiveRecord::Base
  has_many :submissions
  validates :title, presence: true
  validates :text, presence: true
  
end
