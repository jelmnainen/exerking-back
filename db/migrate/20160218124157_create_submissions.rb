class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :user_id, null: false
      t.integer :exercise_id, null:false
      t.string :feedback
      t.boolean :feedback_asked, default: false
      t.boolean :done, default: false

      t.timestamps null: false
    end
  end
end
