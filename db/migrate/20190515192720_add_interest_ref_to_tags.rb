class AddInterestRefToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :interest, index: true
  end
end
