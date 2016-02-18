class Submission < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :exercise, dependent: :destroy

  validates :user_id, presence: true
  validates :exercise_id, presence: true
end
