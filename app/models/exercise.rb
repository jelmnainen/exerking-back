class Exercise < ActiveRecord::Base
  has_many :submissions
  belongs_to :category
  validates :title, presence: true
  validates :text, presence: true
  
end
