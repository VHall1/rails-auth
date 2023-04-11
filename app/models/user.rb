class User < ApplicationRecord
  has_many :groups, through: :user_groups
  has_many :user_groups

  before_save :downcase_email

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true

  # https://api.rubyonrails.org/v7.0.4/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password

  def downcase_email
    self.email = email.downcase
  end
end
