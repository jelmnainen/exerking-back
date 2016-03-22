class ExerciseSerializer < ActiveModel::Serializer

  attributes :id, :title, :text, :deadline, :file_upload, :batch_id, :category_id

end