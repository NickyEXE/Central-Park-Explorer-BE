class RemoveLocationFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :location_id
  end
end
