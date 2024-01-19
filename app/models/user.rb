# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  has_one_attached :photo

  PASSWORD_FORMAT = /\A
    (?=.{8,})          # Must contain 8 or more characters
    (?=.*\d)           # Must contain a digit
    (?=.*[a-z])        # Must contain a lower case character
    (?=.*[A-Z])        # Must contain an upper case character
  /x

  before_validation :ensure_session_token

  validates :password, 
    length: { minimum: 8, message: "requires a minimum of 8 characters" }, 
    format: { with: PASSWORD_FORMAT, message: "requires uppercase, lowercase letters, and one number"}, 
    allow_nil: true

  validates :email, 
    uniqueness: true, 
    length: { in: 3..100 }, 
    format: { with: URI::MailTo::EMAIL_REGEXP, message: "is invalid" } #update this verification

  validates :session_token, presence: true, uniqueness: true

  def ensure_session_token
      self.session_token ||= generate_unique_session_token
  end

  def reset_session_token!
      self.session_token = generate_unique_session_token
      save!
      session_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user&.authenticate(password) 
        return user
    else
        nil 
    end
  end

  private

  def generate_unique_session_token
      while true
          token = SecureRandom.urlsafe_base64
          return token unless User.exists?(session_token: token)
      end
  end


end
