class FavoriteSchool < ActiveRecord::Base
    belongs_to :school
    belongs_to :user
end
