class AddFileSecretToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :file_secret, :string
  end
end
