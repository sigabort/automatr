class Institute < ActiveRecord::Base
  validates :name,     :presence => true,
                       :uniqueness => true,
                       :length => {:minimum => 1, :maximum => 255}

  validates :display_name, :length => {:maximum => 1024}

  validates :description, :length => {:maximum => 2048}

  #Status is set to "Active" if not specified (by default)
  validates :status,   :status => true

  #Set accessible attributes. Code cannot be set in mass assignment.
  attr_accessible :name, :display_name, :description, :email, :status
  
end
