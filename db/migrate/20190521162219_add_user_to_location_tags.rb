class AddUserToLocationTags < ActiveRecord::Migration[5.2]
  def change
    add_column :location_tags, :review, :string
    add_reference :location_tags, :user, index: true
  end
end
