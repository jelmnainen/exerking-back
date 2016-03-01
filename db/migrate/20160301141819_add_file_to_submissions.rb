class AddFileToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :data, :binary
    add_column :submissions, :filename, :string
  end
end
