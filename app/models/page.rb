class Page < ActiveRecord::Base
       
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :students


  scope :visible, lambda{where(:visible => true)}
  scope :invisible, lambda{where(:visible => false)}
  scope :sorted, lambda{order("pages.position ASC")}
  scope :newest_first, lambda{order("pages.created_at DESC")}

end
