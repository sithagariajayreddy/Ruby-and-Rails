class Section < ActiveRecord::Base
    
  belongs_to :page
  has_and_belongs_to_many :students
  
  acts_as_list  :scope => :page
   

  validates :name, :presence => true, :length => {:maximum => 255}
  validates :content_type, :inclusion => {:in => ['text', 'HTML']}
  validates :content, :presence => true

  scope :visible, lambda{where(:visible => true)}
  scope :invisible, lambda{where(:visible => false)}
  scope :sorted, lambda{order("sections.position ASC")}
  scope :newest_first, lambda{order("sections.created_at DESC")}
end
