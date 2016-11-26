# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  title      :string
#  rating     :integer
#  comment    :text
#  school_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = User.new do |u|
      u.name = "Grace"
      u.description = "Inventor of the first programming language compiler."
      u.email = "grace@hopper.com"
      u.password = "ikillallthebugs"
      u.password_confirmation = "ikillallthebugs"
    end
    @user.save
    @school = School.new do |s|
      s.name = "Capybara High School"
      s.address = "3401 Walnut Street"
      s.grade_level = "high"
      s.zipcode = "19104"
      s.school_type = "Public"
      s.latitude = "39.952975"
      s.longitude = "-75.191361"
    end
    @school.save
    @review = @school.reviews.build(title: "Hey, it's a title!", 
                                    rating: 5, 
                                    comment: "Yes, I have comments on this.", 
                                    user_id: @user.id)
  end
  
  test "should be valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end
  
  test "school id should be present" do
    assert_equal @school.id, @review.school_id
  end
end
