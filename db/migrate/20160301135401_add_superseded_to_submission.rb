class AddSupersededToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :superseded_by, :integer
    add_index :submissions, :superseded_by, unique: true
  end
end
