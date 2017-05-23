class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :url
      t.text :description

      t.timestamps
    end
  end
end
