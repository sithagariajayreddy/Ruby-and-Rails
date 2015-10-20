class Student < ActiveRecord::Base

  has_and_belongs_to_many :pages
  has_and_belongs_to_many :sections

  has_secure_password

  
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/i
  validates :first_name, :presence => true, :length => {:maximum => 25}
  validates :last_name, :presence => true, :length => {:maximum => 50}
  validates :username, :length => {:within => 5..25}, :uniqueness => true
  validates :email, :presence => true, :length =>{:maximum => 100}, :format => EMAIL_REGEX, :confirmation => true

  scope :sorted, lambda{order("first_name ASC", "last_name ASC")}

  def name
    "#{first_name} #{last_name}"
  end

end
