class RemoveDeadlineFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :deadline, :datetime
  end
end
