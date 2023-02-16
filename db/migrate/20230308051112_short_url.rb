class ShortUrl < ActiveRecord::Migration[7.0]
  def change
    create_table :short_urls do |t|
      t.text :original_url, null: false
      t.string :short_url, null: false

      t.timestamps
    end

    add_index :short_urls, :short_url, unique: true
  end
end
