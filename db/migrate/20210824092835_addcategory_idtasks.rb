class AddcategoryIdtasks < ActiveRecord::Migration[6.1]
  def change
  	add_column :tasks, :category_id , :integer, :references => "category"
  end
end
