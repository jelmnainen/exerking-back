require 'base64'

class Submission < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :exercise, dependent: :destroy

  default_scope { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :exercise_id, presence: true
  validate :deadline_expired, on: :create

  before_create :decode_file!, :generate_file_token!
  after_create :supersede!

  private

  def deadline_expired
    if exercise.deadline? and exercise.deadline < Time.now
      errors.add('exercise_id', 'Deadline has expired.')
    end
  end

  def supersede!
    submissions = Submission.where(user_id: user_id, exercise_id: exercise_id, superseded_by: nil).where.not(id: id)
    if submissions.size == 1
      previous = submissions.first
      previous.superseded_by = id
      previous.save!
    end
  end

  def decode_file!
    self.file_content = Base64.decode64(file_content) unless file_content.nil?
  end

  def generate_file_token!
    self.file_secret = Devise.friendly_token unless file_content.nil?
  end

end
