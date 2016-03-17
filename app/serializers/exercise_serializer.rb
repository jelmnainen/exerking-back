class ExerciseSerializer < ActiveModel::Serializer

  attributes :id, :title, :text, :deadline, :file_upload, :category_id

end