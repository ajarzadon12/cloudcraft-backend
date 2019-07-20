class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :username,          type: String, default: ""
  field :password_digest,   type: String, default: ""

  has_secure_password
  has_many :user_architecture

  validates_uniqueness_of :username
end
