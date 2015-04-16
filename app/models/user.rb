class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true

  after_initialize :ensure_session_token

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    if user
      user.is_password?(password) ? user : nil
    else
      nil
    end
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    self.password = Bcrypt::Password.create(password)
  end

  def is_password?(password)
    Bcrypt::Password.new(self.password).is_password?(password)
  end

end
