require 'bcrypt'
class User

  attr_reader :password

  include DataMapper::Resource

  property :id, Serial
  property :email, String, :unique => true, :message => "This email is already taken"
  property :name, String
  property :user_name, String, :unique => true, :message => "This username is already taken"
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
