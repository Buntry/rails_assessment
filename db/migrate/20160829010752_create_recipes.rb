class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :user_id
			t.integer :ingredients_count, default: 0
			
      t.timestamps null: false
    end
  end
end
