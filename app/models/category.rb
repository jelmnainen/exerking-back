class Category < ActiveRecord::Base
  has_many :exercises, dependent: :nullify
  validates :title, presence: true
end
