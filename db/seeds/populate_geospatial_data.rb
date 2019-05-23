# ripping off this medium post: https://medium.com/@praagyajoshi/importing-combining-and-visualising-geospatial-data-in-a-rails-app-e63a01b5931b
puts "In the file"
from_pond_shp_sql = `shp2pgsql -c -g geom -W LATIN1 -s 4326 #{Rails.root.join('db', 'shapefiles', 'Pond.shp')} locations_ref`
connection.execute "drop table if exists locations_ref"
connection.execute from_pond_shp_sql
connection.execute <<-SQL
    insert into location(name, geom, created_at, updated_at)
      select name, geom, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP from locations_ref
SQL
connection.execute "drop table locations_ref"
