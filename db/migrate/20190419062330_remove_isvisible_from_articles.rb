class RemoveIsvisibleFromArticles < ActiveRecord::Migration[5.2]
  def change
  	remove_column :articles,:is_visible
  end
end
