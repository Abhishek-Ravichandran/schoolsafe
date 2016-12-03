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
#  user_id     :integer
#

class School < ActiveRecord::Base
    has_many :reviews
    
    belongs_to :user
    has_many :favorite_schools
    has_many :favorited_by, through: :favorite_schools, source: :user 
    
    validates :name, presence: true
    validates :address, presence: true
    validates :zipcode, presence: true
    validates :grade_level, presence: true
    validates :school_type, presence: true
    validates :latitude, presence: true
    validates :longitude, presence: true
end
