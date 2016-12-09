class AddUserIdToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :user_id, :integer
    add_reference :reviews, :user, index: true
    add_foreign_key :reviews, :users
  end
end
