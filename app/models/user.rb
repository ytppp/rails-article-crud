class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(.[a-zA-Z0-9_-]+)+/ } // /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password_digest, presence: true
  validates :role, inclusion: { in: [0, 1, 2], message: "role can be only in [0 1 2]" }
  
  has_secure_password
end
