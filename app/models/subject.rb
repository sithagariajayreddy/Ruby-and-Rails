class Subject < ActiveRecord::Base

   has_many :pages

   scope :visible, lambda{where(:visible => true)}
   scope :invisible, lambda{where(:visible => false)}
   scope :sorted, lambda{order("position ASC")}
   scope :newfirst, lambda{order("created_at DESC")}
   scope :search, lambda{|query| where(["name LIKE ?", "%#{query}%"])}
end