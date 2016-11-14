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

class Review < ActiveRecord::Base
    belongs_to :school
    belongs_to :user
    
    validates :title, presence: {minimum: 5, maximum: 50,
        too_short: "Your title must be at least %{count} characters.",
        too_long: "Your title cannot be longer than %{count} characters."
    }
    validates :rating, presence: true, numericality: {
        greater_than: 0, less_than: 6, only_integer: true
    }
    validates :comment, presence: {minimum: 5, maximum: 1000,
        too_short: "Your review must be at least %{count} characters.",
        too_long: "Your review cannot be longer than %{count} characters."
    }
    validates :school_id, presence: true
    #validates :user, presence: true
end
