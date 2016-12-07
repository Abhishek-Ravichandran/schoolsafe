# == Schema Information
#
# Table name: favorite_schools
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FavoriteSchool < ActiveRecord::Base
    belongs_to :school
    belongs_to :user
end
