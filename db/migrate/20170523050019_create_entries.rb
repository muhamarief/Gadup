class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :feed
      t.text :entries_url
      t.text :image_url
      t.string :title
      t.string :content
      t.string :author
      t.datetime :published

      t.timestamps
    end
  end
end
