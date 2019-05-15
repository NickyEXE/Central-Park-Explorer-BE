class CreateFacts < ActiveRecord::Migration[5.2]
  def change
    create_table :facts do |t|
      t.string :factoid
      t.belongs_to :location, foreign_key: true

      t.timestamps
    end
  end
end
