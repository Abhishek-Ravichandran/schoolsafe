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

require 'test_helper'

class FavoriteSchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
