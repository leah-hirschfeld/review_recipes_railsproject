class RemoveRecipeIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :recipe_id, :integer
  end
end
