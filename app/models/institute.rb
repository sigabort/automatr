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
  
  #Scope to get the institute with given name
  scope :with_name, lambda { |name| where(:name => name)}
  
  #Scope to get the institutes with given offset and limit
  scope :browse, lambda { |offset, limit| limit(limit).offset(offset) }
  
  # This method is called when we use redirect_to(object)
  # to use the model attribute to use in the URLs.  By default,
  # rails uses 'id' as model attribute in each URL. To override
  # that behavior we need this method to specify which model attribute
  # to use in the URLs
  def to_param
    name
  end
  
end
