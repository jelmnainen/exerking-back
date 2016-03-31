class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :title
      t.datetime :deadline

      t.timestamps null: false
    end
    add_column :exercises, :batch_id, :integer
  end
end
