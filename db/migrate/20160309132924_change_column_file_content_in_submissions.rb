class ChangeColumnFileContentInSubmissions < ActiveRecord::Migration
  def change
    change_column :submissions, :file_content, :binary
  end
end
