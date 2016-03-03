class AddFileToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :file_content, :string
    add_column :submissions, :file_type, :string
  end
end
