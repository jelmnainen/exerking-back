class SubmissionSerializer < ActiveModel::Serializer

  attributes :id, :user_id, :exercise_id, :feedback_asked, :feedback, :data, :filename, :done

end