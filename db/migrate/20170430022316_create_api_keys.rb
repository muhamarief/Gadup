class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.references :owner, polymorphic: true, null: false
      t.string :access_token
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
