class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :grade_level
      t.string :school_type
      t.string :latitude
      t.string :longitude
      
      t.timestamps null: false
    end
  end
end
