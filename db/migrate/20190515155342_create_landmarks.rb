class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.string :description
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
