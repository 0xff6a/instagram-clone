class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :address, :location
  end
end
