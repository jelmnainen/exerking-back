class SubmissionSerializer < ActiveModel::Serializer

  attributes :id, :user_id, :exercise_id, :feedback_asked, :feedback, :done, :created_at, :superseded_by, :file_url

  def file_url
    "#{file_submission_url(self.object)}?secret=#{self.object.file_secret}" unless self.object.file_content.nil?
  end

end
