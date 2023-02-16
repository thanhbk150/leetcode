class Image < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.bigint :user_id, null: false
      t.string :type, null: false
      t.string :original_filename, null: false
      t.string :file_path, null: false
      t.boolean :has_resize, default: false
      t.timestamps
    end

    add_index :images, [:user_id, :type]
  end
end
