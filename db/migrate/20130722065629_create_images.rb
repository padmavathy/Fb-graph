class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.string :title
      t.integer :user_id
      t.text :description
      t.timestamps
    end
  end
end
