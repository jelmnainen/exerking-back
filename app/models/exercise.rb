class Exercise < ActiveRecord::Base
  belongs_to :batch
  has_many :submissions
  belongs_to :category
  validates :title, presence: true
  validates :text, presence: true
  validates :batch, presence: true
  
end
