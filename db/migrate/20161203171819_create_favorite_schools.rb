class CreateFavoriteSchools < ActiveRecord::Migration
  def change
    create_table :favorite_schools do |t|
      t.integer :user_id
      t.integer :school_id

      t.timestamps null: false
    end
  end
end
