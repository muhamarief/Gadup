class AddRelationTipsAndEntry < ActiveRecord::Migration[5.0]
  def change
    add_reference :gadup_tips, :entry, index: { unique: true }, foreign_key: true
  end
end
