# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  image           :binary
#  review_id       :integer
#  school_id       :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#  password_digest :string
#  remember_digest :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
