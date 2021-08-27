class RemoveDpFromprofiles < ActiveRecord::Migration[6.1]
 def change
  	remove_column :profiles, :dp, :binary
  end
end
