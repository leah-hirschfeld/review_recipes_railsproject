class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.text :instructions
      t.integer :recipe_id

      t.timestamps
    end
  end
end
