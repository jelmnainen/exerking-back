class Batch < ActiveRecord::Base
  has_many :exercises
  validates :title, presence: true
  validates :deadline, presence: true
end
