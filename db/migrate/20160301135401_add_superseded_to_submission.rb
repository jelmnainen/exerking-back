class AddSupersededToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :superseded_by, :integer
  end
end
