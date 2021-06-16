class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
