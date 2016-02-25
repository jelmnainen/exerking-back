class AddFileUploadFlagToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :file_upload, :boolean, default: false
  end
end
