class User < ActiveRecord::Base
  
  has_many :rounds
  #has_many :friends
  #has_many :clubsets
  #has_many :coaches
  #has_many :diaries
  #has_many :instructors
  
  validates_presence_of  :fname
  validates_presence_of  :lname
  validates_presence_of  :email
  validates_uniqueness_of :email
  
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  
  def validate
    errors.add_to_base("Missing password") if hashed_password.blank?
  end
  
  def self.user_info(user_id)
    User.find(:first, :conditions => ["users.id = ?", user_id])
  end
  
  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  
  
  #'password' is a virtual attribute
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password - User.encrypted_password(self.password, self.salt)
  end
  
  
  private
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "shanktastic" + salt #middle word makes it harder to guess
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
end
