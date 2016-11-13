class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :description
      t.binary :image
      t.references :review, index: true
      t.references :school, index: true

      t.timestamps null: false
    end
  end
end
