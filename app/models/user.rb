class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :username

  validates :email,         :presence => true,
                            :uniqueness => true,
                            :format => { :with => /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/}
  validates :username,      :presence => true,
                            :uniqueness => true
  validates :password_digest, :presence => true,
                            :length => { :minimum => 6 }

  before_save do
    self.email.downcase! if self.email
  end




end
