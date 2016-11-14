# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  address     :string
#  zipcode     :string
#  grade_level :string
#  school_type :string
#  latitude    :string
#  longitude   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class School < ActiveRecord::Base
    has_many :reviews
    
    validates :name, presence: true
    validates :address, presence: true
    validates :zipcode, presence: true
    validates :grade_level, presence: true
    validates :school_type, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
end
