class AddReferencesAdminsToEntriesFeeds < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :admin
    add_reference :feeds, :admin
  end
end
