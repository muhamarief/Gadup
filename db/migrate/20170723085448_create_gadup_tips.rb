class CreateGadupTips < ActiveRecord::Migration[5.0]
  def change
    create_table :gadup_tips do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :display_picture
      t.string :author, null: false

      t.timestamps
    end
  end
end
