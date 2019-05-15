class RemoveLocationKeyFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :tags, column: :location_id
  end
end
