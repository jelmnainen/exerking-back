class Category < ActiveRecord::Base
  has_many :exercises
  validates :title, presence: true
end
