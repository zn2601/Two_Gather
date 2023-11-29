class UpdateLangLongToUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :latitude
    remove_column :posts, :longitude
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
