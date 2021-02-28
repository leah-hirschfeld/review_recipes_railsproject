class RemoveRecipeIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :recipe_id, :integer
  end
end
