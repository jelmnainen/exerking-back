class AddTitleAndDescriptionAndDeadlineToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :title, :string
    add_column :exercises, :deadline, :datetime
  end
end
