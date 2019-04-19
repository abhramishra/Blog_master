class UpdateReviewTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reviews, :product_id
  	add_column :reviews, :article_id, :integer
  end
end
