class User < ApplicationRecord

  validates :email, presence: true
  validates :email, uniqueness: true
  validate :validate_password

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_plain_text_password)
    @raw_password = new_plain_text_password
    @password = BCrypt::Password.create(new_plain_text_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password_attempt)
    user = User.find_by_email(email)
    if user && user.password == password_attempt
     return user
    else
     return nil
    end
  end

  def validate_password
    if @raw_password == "" || @raw_password ==  nil
      errors.add(:password, "is required")
    end
  end

end
