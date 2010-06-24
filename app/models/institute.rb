class Institute < ActiveRecord::Base
  validates :name,     :presence => true,
                       :uniqueness => true,
                       :length => {:minimum => 1, :maximum => 255}
  validates :status,   :status => true
  
  before_save :default_values
  
  def default_values
    self.status ||= "Active"
  end

  
end
