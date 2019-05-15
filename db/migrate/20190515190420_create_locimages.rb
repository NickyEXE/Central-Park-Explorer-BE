class CreateLocimages < ActiveRecord::Migration[5.2]
  def change
    create_table :locimages do |t|
      t.string :url
      t.string :alt
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
