class ChangeLocationsToBeSridOf4236 < ActiveRecord::Migration[5.2]
  def up
    change_column :locations, :geom, :geometry, limit: {:srid=>4326, :type=>"multi_polygon"}
  end
  def down
    change_column :locations, :geom, :geometry, limit: {:srid=>0, :type=>"multi_polygon"}
  end
end
