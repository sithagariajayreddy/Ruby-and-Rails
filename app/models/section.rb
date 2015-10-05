class Section < ActiveRecord::Base
    
  belongs_to :page
  has_and_belongs_to_many :students

  scope :visible, lambda{where(:visible => true)}
  scope :invisible, lambda{where(:visible => false)}
  scope :sorted, lambda{order("sections.position ASC")}
  scope :newest_first, lambda{order("sections.created_at DESC")}
end
