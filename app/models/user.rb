class User < ActiveRecord::Base

  has_secure_password
  has_many :orders
  has_many :reviews

  validates :email, uniqueness: true
  # Users cannot register their email more than once

  def name
    firstname + " " + lastname
  end

end
