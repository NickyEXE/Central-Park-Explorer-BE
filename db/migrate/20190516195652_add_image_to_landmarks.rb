class AddImageToLandmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :landmarks, :image, :string
  end
end
