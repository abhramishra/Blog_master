class AddVisibleToArticle < ActiveRecord::Migration[5.2]
  def change
  	add_column :articles,:is_visible,:boolean,default: true
  end
end
