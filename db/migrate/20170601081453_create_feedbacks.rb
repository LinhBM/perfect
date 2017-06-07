class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.string :subject
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :feedbacks, :user_id, unique: true
  end
end
