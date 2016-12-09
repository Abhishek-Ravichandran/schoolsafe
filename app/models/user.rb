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

class User < ActiveRecord::Base
  include Gravtastic
  is_gravtastic
  
  has_many :reviews
  has_many :schools
  has_many :favorite_schools
  has_many :favorites, through: :favorite_schools, source: :school
  
  attr_accessor :remember_token
  
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
  validates :email, presence: true, 
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 10 }, allow_nil: true
  
  #Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # Forgets a user to enable logout.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
