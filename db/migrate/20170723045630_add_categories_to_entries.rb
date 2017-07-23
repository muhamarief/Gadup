class AddCategoriesToEntries < ActiveRecord::Migration[5.0]
  def self.up
    add_column :entries, :category, :integer
    Entry.all.each do |entry|
      entry.category = 1
      entry.save
    end
  end

  def self.down
    remove_column :entries, :category
  end
end
