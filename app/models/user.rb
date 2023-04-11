class User < ApplicationRecord
  attr_accessor :password_digest

  before_save :downcase_email

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password

  def downcase_email
    self.email = email.downcase
  end

  def check_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end
end