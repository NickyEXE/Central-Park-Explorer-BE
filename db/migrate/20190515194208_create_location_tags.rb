class CreateLocationTags < ActiveRecord::Migration[5.2]
  def change
    create_table :location_tags do |t|
      t.references :location, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
