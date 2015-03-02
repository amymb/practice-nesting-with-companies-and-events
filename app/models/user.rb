class User < ActiveRecord::Base
  has_secure_password
  validates :password_confirmation, presence: true
  validates :password, presence: true
  validates :password, length: {in: 5..20}

  validates :email, uniqueness: true, length: {in: 6..40}, presence: true
end
