class User < ApplicationRecord
  #attr_accessor :name, :email
  validates(:name, presence: true, length: { maximum: 50 })
  validates(
    :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    uniqueness: { case_sensitive: false }
  )

  before_save { self.email = email.downcase }

  has_secure_password
  validates(:password, length: { minimum: 6 })
end
