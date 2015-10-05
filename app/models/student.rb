class Student < ActiveRecord::Base

  has_and_belongs_to_many :pages
  has_and_belongs_to_many :sections

end
