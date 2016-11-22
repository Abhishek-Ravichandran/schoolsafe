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
#

class User < ActiveRecord::Base
  has_many :reviews
  before_save {self.email = email.downcase}
  validates :name, presence: {minimum: 5, maximum: 10,
        too_short: "Your username must be at least %{count} characters.",
        too_long: "Your username cannot be longer than %{count} characters."
    }, uniqueness: true
  validates :description, presence: {minimum: 5, maximum: 100,
    too_short: "Your description must be at least %{count} characters.",
    too_long: "Your description cannot be longer than %{count} characters."
  }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 10 }, allow_nil: true
end
